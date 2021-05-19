variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AWS_ZONE_A" {
  default = "us-west-2a"
}

variable "AWS_ZONE_B" {
  default = "us-west-2b"
}

variable "ENVIRONMENT" {
  default = "research"
}

variable "CIDR_BLOCK" {
  type = map(string)
  default = {
    "vpc" = "10.0.0.0/16"
    "subnet-public-A" = "10.0.0.0/22"
    "subnet-public-B" = "10.0.4.0/22"
    "subnet-k8-A" = "10.0.20.0/22"
    "subnet-k8-B" = "10.0.24.0/22"
    "subnet-db-A" = "10.0.48.0/20"
    "subnet-db-B" = "10.0.64.0/20"
    "subnet-public-bastion-A" = "10.0.12.0/24"
  }
}