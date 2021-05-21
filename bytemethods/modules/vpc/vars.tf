variable "AWS_REGION" {
  default = "us-west-2"
}

variable "environment" {
  type = string
  default = "research"
}

variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "rt_vpc" {
  type = object({
    name = string
    cidr_block = string
  })

  default = {
    name = "theory-k8s"
    cidr_block = "10.0.0.0/16"
  }
}


variable "rt_subnets" {
  //[cidr_block,is_public,zone]
  type = map(tuple([string,bool,string]))
  default = {
    "subnet-A" = ["10.0.0.0/22",true,"us-west-2a"]
    "subnet-B" = ["10.0.4.0/22",true,"us-west-2b"]
    "subnet-k8-A" = ["10.0.20.0/22",false,"us-west-2a"]
    "subnet-k8-B" = ["10.0.24.0/22",false,"us-west-2b"]
    "subnet-db-A" = ["10.0.48.0/20",false,"us-west-2a"]
    "subnet-db-B" = ["10.0.64.0/20",false,"us-west-2b"]
    "subnet-bastion-A" = ["10.0.12.0/24",true,"us-west-2a"]
  }
}
