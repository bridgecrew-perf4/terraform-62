terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

module "vpc" {
  source      = "../modules/vpc"
  environment = "dev"
}