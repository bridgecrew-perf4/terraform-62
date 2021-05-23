# State Mgmt
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "realtheory-v1-terraform-state"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "realtheory-v1-terraform-state-${var.environment}"
    Environment = var.environment
  }

  lifecycle {
    prevent_destroy = true
  }
}