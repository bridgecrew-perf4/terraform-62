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

resource "aws_subnet" "research_subnet_public_1" {
    vpc_id = aws_vpc.research-vpc.id
    cidr_block = "10.0.20.0/22"
    map_public_ip_on_launch = "true"
    availability_zone = var.AWS_ZONE_A
    tags = {
        Name = "research_subnet_public_1"
        Environment = var.ENVIRONMENT
    }
}

resource "aws_subnet" "research_subnet_public_2" {
    vpc_id = aws_vpc.research-vpc.id
    cidr_block = "10.0.4.0/22"
    map_public_ip_on_launch = "true"
    availability_zone = var.AWS_ZONE_B
    tags = {
        Name = "research_subnet_public_2"
        Environment = var.ENVIRONMENT
    }
}