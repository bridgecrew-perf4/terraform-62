terraform {
  backend "s3" {
    bucket = "realtheory-v1-terraform-state"
    key = "research/terraform.tfstate"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}
module "vpc" {
  source      = "../../modules/vpc"
  environment = "dev"
  rt_subnets = {
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

  rt_route_associations = ["subnet-A", "subnet-B"]
  rt_nat_subnet         = "subnet-B"
}

