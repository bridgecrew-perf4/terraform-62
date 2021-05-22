
module "vpc" {
  source      = "../modules/vpc"
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
  }

  rt_route_associations = [ "subnet-A","subnet-B"]
  rt_nat_subnet = "subnet-B"
}

