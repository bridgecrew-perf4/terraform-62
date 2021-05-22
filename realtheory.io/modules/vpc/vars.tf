provider "aws" {
  region = "us-west-2"
}

variable "environment" {
  type        = string
  description = "The environment such as dev, staging, research ,prod, etc."
  default     = "research"

}

variable "rt_vpc" {
  type = object({
    name       = string
    cidr_block = string
  })

  description = "The VPC name"

  default = {
    name       = "theory-k8s"
    cidr_block = "10.0.0.0/16"
  }
}

variable "rt_subnets" {
  type = map(object({
    cidr_block = string
    zone       = string
    public     = bool
  }))

  default = {
    "subnet-A" = {
      cidr_block = "10.0.0.0/22"
      zone       = "us-west-2a"
      public     = true
    }
    "subnet-B" = {
      cidr_block = "10.0.4.0/22"
      zone       = "us-west-2b"
      public     = true
    }
    "subnet-k8-A" = {
      cidr_block = "10.0.20.0/22"
      zone       = "us-west-2a"
      public     = false
    }
    "subnet-k8-B" = {
      cidr_block = "10.0.24.0/22"
      zone       = "us-west-2b"
      public     = false
    }
    "subnet-db-A" = {
      cidr_block = "10.0.48.0/20"
      zone       = "us-west-2a"
      public     = false
    }
    "subnet-db-B" = {
      cidr_block = "10.0.64.0/20"
      zone       = "us-west-2b"
      public     = false
    }
    "subnet-bastion-A" = {
      cidr_block = "10.0.12.0/24"
      zone       = "us-west-2a"
      public     = true
    }
  }
}

variable "rt_route_associations" {

  type = list(string)

  description = "The default route table associations"

  default = ["subnet-k8-A", "subnet-k8-B", "subnet-db-A", "subnet-db-B"]

}
