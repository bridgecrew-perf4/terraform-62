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
  //[cidr_block,is_public,zone]
  type = map(tuple([string, bool, string]))

  description = "Subnets [cidr_block,is_public,zone]"

  default = {
    "subnet-A"         = ["10.0.0.0/22", true, "us-west-2a"]
    "subnet-B"         = ["10.0.4.0/22", true, "us-west-2b"]
    "subnet-k8-A"      = ["10.0.20.0/22", false, "us-west-2a"]
    "subnet-k8-B"      = ["10.0.24.0/22", false, "us-west-2b"]
    "subnet-db-A"      = ["10.0.48.0/20", false, "us-west-2a"]
    "subnet-db-B"      = ["10.0.64.0/20", false, "us-west-2b"]
    "subnet-bastion-A" = ["10.0.12.0/24", true, "us-west-2a"]
  }
}

variable "rt_route_associations" {

  type = list(string)

  description = "The default route table associations"

  default = ["subnet-k8-A", "subnet-k8-B", "subnet-db-A", "subnet-db-B"]

}
