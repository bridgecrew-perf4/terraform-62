#vpc 
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

#public subnet A
resource "aws_subnet" "research_subnet_public_A" {
    vpc_id = aws_vpc.research_vpc.id
    cidr_block = "10.0.0.0/22"
    map_public_ip_on_launch = "true"
    availability_zone = var.AWS_ZONE_A
    tags = {
        Name = "research-subnet-public-A"
        Environment = var.ENVIRONMENT
    }
}

#public subnmet B
resource "aws_subnet" "research_subnet_public_B" {
    vpc_id = aws_vpc.research_vpc.id
    cidr_block = "10.0.4.0/22"
    map_public_ip_on_launch = "true"
    availability_zone = var.AWS_ZONE_B
    tags = {
        Name = "research-subnet-public-B"
        Environment = var.ENVIRONMENT
    }
}


#k8 subnet A
resource "aws_subnet" "research_subnet_k8s_A" {
    vpc_id = aws_vpc.research_vpc.id
    cidr_block = "10.0.20.0/22"
    map_public_ip_on_launch = "false"
    availability_zone = var.AWS_ZONE_A
    tags = {
        Name = "research-subnet-k8s-A"
        Environment = var.ENVIRONMENT
    }
}


#k8 subnet B
resource "aws_subnet" "research_subnet_k8s_B" {
    vpc_id = aws_vpc.research_vpc.id
    cidr_block = "10.0.24.0/22"
    map_public_ip_on_launch = "false"
    availability_zone = var.AWS_ZONE_B
    tags = {
        Name = "research-subnet-k8s-B"
        Environment = var.ENVIRONMENT
    }
}


#DB subnet A
resource "aws_subnet" "research_subnet_db_A" {
    vpc_id = aws_vpc.research_vpc.id
    cidr_block = "10.0.48.0/20"
    map_public_ip_on_launch = "false"
    availability_zone = var.AWS_ZONE_A
    tags = {
        Name = "research-subnet-db-A"
        Environment = var.ENVIRONMENT
    }
}


#DB subnet B
resource "aws_subnet" "research_subnet_db_B" {
    vpc_id = aws_vpc.research_vpc.id
    cidr_block = "10.0.64.0/20"
    map_public_ip_on_launch = "false"
    availability_zone = var.AWS_ZONE_B
    tags = {
        Name = "research-subnet-db-B"
        Environment = var.ENVIRONMENT
    }
}
