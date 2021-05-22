# VPC

resource "aws_vpc" "rt_vpc" {
  cidr_block           = var.rt_vpc.cidr_block
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"
  tags = {
    Name        = "${var.rt_vpc.name}-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_subnet" "rt_subnets" {

  for_each = var.rt_subnets

  vpc_id                  = aws_vpc.rt_vpc.id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.public
  availability_zone       = each.value.zone
  tags = {
    Name        = "${each.key}-${var.environment}"
    Environment = var.environment
  }
}

## IGW
resource "aws_internet_gateway" "rt_igw" {
  vpc_id = aws_vpc.rt_vpc.id

  tags = {
    Name        = "${var.environment}-igw"
    Environment = var.environment
  }
}

## Route Table

resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.rt_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rt_igw.id
  }

  tags = {
    Name        = "${var.environment}-route-table"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "rt_route_associations" {

  for_each = toset(var.rt_route_associations)

  route_table_id = aws_default_route_table.route_table.id
  subnet_id = aws_subnet.rt_subnets[each.value].id
}


# Elastic IP for NAT GW
resource "aws_eip" "rt_nat_eip" {

  vpc = true

  tags = {
    Name        = "${var.environment}-nat-eip"
    Environment = var.environment
  }

  depends_on = [
    aws_route_table_association.rt_route_associations
  ]
}


# NAT GW
resource "aws_nat_gateway" "rt_nat_gw" {

  allocation_id = aws_eip.rt_nat_eip.id

  subnet_id = aws_subnet.rt_subnets["subnet-k8-A"].id

  tags = {
    Name        = "${var.environment}-nat-gw"
    Environment = var.environment
  }

  depends_on = [
    aws_eip.rt_nat_eip
  ]

}

resource "aws_route_table" "rt_nat_gw_rt" {

  vpc_id = aws_vpc.rt_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.rt_nat_gw.id
  }

  tags = {
    Name        = "${var.environment}-nat-gw-rt"
    Environment = var.environment
  }


  depends_on = [
    aws_nat_gateway.rt_nat_gw
  ]

}