module "vpc" {
  source = "../modules/vpc"
  AWS_REGION = "us-east-1"
  AWS_ZONE_A = "us-east-1a"
  AWS_ZONE_B = "us-east-1b"
  ENVIRONMENT = "research"
}