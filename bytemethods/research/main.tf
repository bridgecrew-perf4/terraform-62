module "vpc" {
  source = "../modules/vpc"
  AWS_REGION = "us-west-2"
  AWS_ZONE_A = "us-west-2a"
  AWS_ZONE_B = "us-west-2b"
  ENVIRONMENT = "dev"
}