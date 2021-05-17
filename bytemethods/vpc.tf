# VPC 

resource "aws_vpc" "research_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"
  tags = {
    Name        = "theory-k8s-research"
    Environment = var.ENVIRONMENT
  }
}

## Public Subnet A

resource "aws_subnet" "research_subnet_public_A" {
  vpc_id                  = aws_vpc.research_vpc.id
  cidr_block              = "10.0.0.0/22"
  map_public_ip_on_launch = "true"
  availability_zone       = var.AWS_ZONE_A
  tags = {
    Name        = "research-subnet-public-A"
    Environment = var.ENVIRONMENT
  }
}

## public Subnet B

resource "aws_subnet" "research_subnet_public_B" {
  vpc_id                  = aws_vpc.research_vpc.id
  cidr_block              = "10.0.4.0/22"
  map_public_ip_on_launch = "true"
  availability_zone       = var.AWS_ZONE_B
  tags = {
    Name        = "research-subnet-public-B"
    Environment = var.ENVIRONMENT
  }
}


## K8 Subnet A 

resource "aws_subnet" "research_subnet_k8s_A" {
  vpc_id                  = aws_vpc.research_vpc.id
  cidr_block              = "10.0.20.0/22"
  map_public_ip_on_launch = "false"
  availability_zone       = var.AWS_ZONE_A
  tags = {
    Name        = "research-subnet-k8s-A"
    Environment = var.ENVIRONMENT
  }
}


## K8 Subnet B
resource "aws_subnet" "research_subnet_k8s_B" {
  vpc_id                  = aws_vpc.research_vpc.id
  cidr_block              = "10.0.24.0/22"
  map_public_ip_on_launch = "false"
  availability_zone       = var.AWS_ZONE_B
  tags = {
    Name        = "research-subnet-k8s-B"
    Environment = var.ENVIRONMENT
  }
}


## DB subnet A

resource "aws_subnet" "research_subnet_db_A" {
  vpc_id                  = aws_vpc.research_vpc.id
  cidr_block              = "10.0.48.0/20"
  map_public_ip_on_launch = "false"
  availability_zone       = var.AWS_ZONE_A
  tags = {
    Name        = "research-subnet-db-A"
    Environment = var.ENVIRONMENT
  }
}


## DB subnet B

resource "aws_subnet" "research_subnet_db_B" {
  vpc_id                  = aws_vpc.research_vpc.id
  cidr_block              = "10.0.64.0/20"
  map_public_ip_on_launch = "false"
  availability_zone       = var.AWS_ZONE_B
  tags = {
    Name        = "research-subnet-db-B"
    Environment = var.ENVIRONMENT
  }
}


## Bastion Subnet A
resource "aws_subnet" "research_subnet_bastion_A" {
  vpc_id                  = aws_vpc.research_vpc.id
  cidr_block              = "10.0.12.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.AWS_ZONE_A
  tags = {
    Name        = "research-subnet-bastion-A"
    Environment = var.ENVIRONMENT
  }
}

## IGW

resource "aws_internet_gateway" "research_igw" {
  vpc_id = aws_vpc.research_vpc.id

  tags = {
    Name        = "internet-gateway"
    Environment = var.ENVIRONMENT
  }
}

## Route Table

resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.research_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.research_igw.id
  }

  tags = {
    Name        = "route-table"
    Environment = var.ENVIRONMENT
  }
}

resource "aws_route_table_association" "k8s_A" {
  subnet_id      = aws_subnet.research_subnet_k8s_A.id
  route_table_id = aws_default_route_table.route_table.id
}


resource "aws_route_table_association" "k8s_B" {
  subnet_id      = aws_subnet.research_subnet_k8s_B.id
  route_table_id = aws_default_route_table.route_table.id
}

resource "aws_route_table_association" "DB_A" {
  subnet_id      = aws_subnet.research_subnet_db_A.id
  route_table_id = aws_default_route_table.route_table.id
}

resource "aws_route_table_association" "DB_B" {
  subnet_id      = aws_subnet.research_subnet_db_B.id
  route_table_id = aws_default_route_table.route_table.id
}


# Elastic IP for NAT GW
resource "aws_eip" "research_nat_eip" {

  vpc = true

  depends_on = [
    aws_route_table_association.k8s_A
  ]
}


# NAT GW
resource "aws_nat_gateway" "research_nat_gw" {

  allocation_id = aws_eip.research_nat_eip.id

  subnet_id = aws_subnet.research_subnet_k8s_A.id

  tags = {
    Name = "research-nat-gw"
  }

  depends_on = [
    aws_eip.research_nat_eip
  ]

}

resource "aws_route_table" "research_nat_gw_rt" {


  vpc_id = aws_vpc.research_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.research_nat_gw.id
  }

  tags = {
    Name = "Route Table for NAT Gateway"
  }

  depends_on = [
    aws_nat_gateway.research_nat_gw
  ]

}




































