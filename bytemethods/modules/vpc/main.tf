# VPC 

resource "aws_vpc" "rt_vpc" {
  cidr_block           = var.CIDR_BLOCK["vpc"]
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"
  tags = {
    Name        = "theory-k8s-${var.ENVIRONMENT}"
    Environment = var.ENVIRONMENT
  }
}

## Public Subnet A

resource "aws_subnet" "rt_subnet_public_A" {
  vpc_id                  = aws_vpc.rt_vpc.id
  cidr_block              = var.CIDR_BLOCK[ "subnet-public-A"]
  map_public_ip_on_launch = "true"
  availability_zone       = var.AWS_ZONE_A
  tags = {
    Name        = "${var.ENVIRONMENT}-subnet-public-A"
    Environment = var.ENVIRONMENT
  }
}

## public Subnet B

resource "aws_subnet" "rt_subnet_public_B" {
  vpc_id                  = aws_vpc.rt_vpc.id
  cidr_block              = var.CIDR_BLOCK["subnet-public-B"]
  map_public_ip_on_launch = "true"
  availability_zone       = var.AWS_ZONE_B
  tags = {
    Name        = "${var.ENVIRONMENT}-subnet-public-B"
    Environment = var.ENVIRONMENT
  }
}


## K8 Subnet A

resource "aws_subnet" "rt_subnet_k8s_A" {
  vpc_id                  = aws_vpc.rt_vpc.id
  cidr_block              = var.CIDR_BLOCK["subnet-k8-A"]
  map_public_ip_on_launch = "false"
  availability_zone       = var.AWS_ZONE_A
  tags = {
    Name        = "${var.ENVIRONMENT}-subnet-k8s-A"
    Environment = var.ENVIRONMENT
  }
}


## K8 Subnet B
resource "aws_subnet" "rt_subnet_k8s_B" {
  vpc_id                  = aws_vpc.rt_vpc.id
  cidr_block              = var.CIDR_BLOCK["subnet-k8-B"]
  map_public_ip_on_launch = "false"
  availability_zone       = var.AWS_ZONE_B
  tags = {
    Name        = "${var.ENVIRONMENT}-subnet-k8s-B"
    Environment = var.ENVIRONMENT
  }
}


## DB subnet A

resource "aws_subnet" "rt_subnet_db_A" {
  vpc_id                  = aws_vpc.rt_vpc.id
  cidr_block              = "10.0.48.0/20"
  map_public_ip_on_launch = "false"
  availability_zone       = var.AWS_ZONE_A
  tags = {
    Name        = "${var.ENVIRONMENT}-subnet-db-A"
    Environment = var.ENVIRONMENT
  }
}


## DB subnet B

resource "aws_subnet" "rt_subnet_db_B" {
  vpc_id                  = aws_vpc.rt_vpc.id
  cidr_block              = var.CIDR_BLOCK["subnet-db-B"]
  map_public_ip_on_launch = "false"
  availability_zone       = var.AWS_ZONE_B
  tags = {
    Name        = "${var.ENVIRONMENT}-subnet-db-B"
    Environment = var.ENVIRONMENT
  }
}


## Bastion Subnet A
resource "aws_subnet" "rt_subnet_bastion_A" {
  vpc_id                  = aws_vpc.rt_vpc.id
  cidr_block              = var.CIDR_BLOCK["subnet-public-bastion-A"]
  map_public_ip_on_launch = "true"
  availability_zone       = var.AWS_ZONE_A
  tags = {
    Name        = "${var.ENVIRONMENT}-subnet-bastion-A"
    Environment = var.ENVIRONMENT
  }
}

## IGW

resource "aws_internet_gateway" "rt_igw" {
  vpc_id = aws_vpc.rt_vpc.id

  tags = {
    Name        = "${var.ENVIRONMENT}-igw"
    Environment = var.ENVIRONMENT
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
    Name        = "${var.ENVIRONMENT}-route-table"
    Environment = var.ENVIRONMENT
  }
}

resource "aws_route_table_association" "k8s_A" {
  subnet_id      = aws_subnet.rt_subnet_k8s_A.id
  route_table_id = aws_default_route_table.route_table.id

}


resource "aws_route_table_association" "k8s_B" {
  subnet_id      = aws_subnet.rt_subnet_k8s_B.id
  route_table_id = aws_default_route_table.route_table.id
}

resource "aws_route_table_association" "DB_A" {
  subnet_id      = aws_subnet.rt_subnet_db_A.id
  route_table_id = aws_default_route_table.route_table.id
}

resource "aws_route_table_association" "DB_B" {
  subnet_id      = aws_subnet.rt_subnet_db_B.id
  route_table_id = aws_default_route_table.route_table.id
}


# Elastic IP for NAT GW
resource "aws_eip" "rt_nat_eip" {

  vpc = true

  tags = {
    Name        = "${var.ENVIRONMENT}-nat-eip"
    Environment = var.ENVIRONMENT
  }

  depends_on = [
    aws_route_table_association.k8s_A
  ]
}


# NAT GW
resource "aws_nat_gateway" "rt_nat_gw" {

  allocation_id = aws_eip.rt_nat_eip.id

  subnet_id = aws_subnet.rt_subnet_k8s_A.id

  tags = {
    Name        = "${var.ENVIRONMENT}-nat-gw"
    Environment = var.ENVIRONMENT
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
    Name        = "${var.ENVIRONMENT}-nat-gw-rt"
    Environment = var.ENVIRONMENT
  }


  depends_on = [
    aws_nat_gateway.rt_nat_gw
  ]

}




































