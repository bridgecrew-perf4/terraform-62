```terraform

$ terraform init
Initializing modules...

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 3.27"...
- Installing hashicorp/aws v3.42.0...
- Installed hashicorp/aws v3.42.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
$ terraform validate
Success! The configuration is valid.

$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource
actions are indicated with the following symbols:
+ create

Terraform will perform the following actions:

# module.vpc.aws_default_route_table.route_table will be created
+ resource "aws_default_route_table" "route_table" {
    + arn                    = (known after apply)
    + default_route_table_id = (known after apply)
    + id                     = (known after apply)
    + owner_id               = (known after apply)
    + route                  = [
        + {
            + cidr_block                 = "0.0.0.0/0"
            + destination_prefix_list_id = ""
            + egress_only_gateway_id     = ""
            + gateway_id                 = (known after apply)
            + instance_id                = ""
            + ipv6_cidr_block            = ""
            + nat_gateway_id             = ""
            + network_interface_id       = ""
            + transit_gateway_id         = ""
            + vpc_endpoint_id            = ""
            + vpc_peering_connection_id  = ""
              },
              ]
    + tags                   = {
        + "Environment" = "dev"
        + "Name"        = "dev-route-table"
          }
    + tags_all               = {
        + "Environment" = "dev"
        + "Name"        = "dev-route-table"
          }
    + vpc_id                 = (known after apply)
      }

# module.vpc.aws_eip.rt_nat_eip will be created
+ resource "aws_eip" "rt_nat_eip" {
    + allocation_id        = (known after apply)
    + association_id       = (known after apply)
    + carrier_ip           = (known after apply)
    + customer_owned_ip    = (known after apply)
    + domain               = (known after apply)
    + id                   = (known after apply)
    + instance             = (known after apply)
    + network_border_group = (known after apply)
    + network_interface    = (known after apply)
    + private_dns          = (known after apply)
    + private_ip           = (known after apply)
    + public_dns           = (known after apply)
    + public_ip            = (known after apply)
    + public_ipv4_pool     = (known after apply)
    + tags                 = {
        + "Environment" = "dev"
        + "Name"        = "dev-nat-eip"
          }
    + tags_all             = {
        + "Environment" = "dev"
        + "Name"        = "dev-nat-eip"
          }
    + vpc                  = true
      }

# module.vpc.aws_internet_gateway.rt_igw will be created
+ resource "aws_internet_gateway" "rt_igw" {
    + arn      = (known after apply)
    + id       = (known after apply)
    + owner_id = (known after apply)
    + tags     = {
        + "Environment" = "dev"
        + "Name"        = "dev-igw"
          }
    + tags_all = {
        + "Environment" = "dev"
        + "Name"        = "dev-igw"
          }
    + vpc_id   = (known after apply)
      }

# module.vpc.aws_nat_gateway.rt_nat_gw will be created
+ resource "aws_nat_gateway" "rt_nat_gw" {
    + allocation_id        = (known after apply)
    + id                   = (known after apply)
    + network_interface_id = (known after apply)
    + private_ip           = (known after apply)
    + public_ip            = (known after apply)
    + subnet_id            = (known after apply)
    + tags                 = {
        + "Environment" = "dev"
        + "Name"        = "dev-nat-gw"
          }
    + tags_all             = {
        + "Environment" = "dev"
        + "Name"        = "dev-nat-gw"
          }
          }

# module.vpc.aws_route_table.rt_nat_gw_rt will be created
+ resource "aws_route_table" "rt_nat_gw_rt" {
    + arn              = (known after apply)
    + id               = (known after apply)
    + owner_id         = (known after apply)
    + propagating_vgws = (known after apply)
    + route            = [
        + {
            + carrier_gateway_id         = ""
            + cidr_block                 = "0.0.0.0/0"
            + destination_prefix_list_id = ""
            + egress_only_gateway_id     = ""
            + gateway_id                 = ""
            + instance_id                = ""
            + ipv6_cidr_block            = ""
            + local_gateway_id           = ""
            + nat_gateway_id             = (known after apply)
            + network_interface_id       = ""
            + transit_gateway_id         = ""
            + vpc_endpoint_id            = ""
            + vpc_peering_connection_id  = ""
              },
              ]
    + tags             = {
        + "Environment" = "dev"
        + "Name"        = "dev-nat-gw-rt"
          }
    + tags_all         = {
        + "Environment" = "dev"
        + "Name"        = "dev-nat-gw-rt"
          }
    + vpc_id           = (known after apply)
      }

# module.vpc.aws_route_table_association.rt_route_associations["subnet-A"] will be created
+ resource "aws_route_table_association" "rt_route_associations" {
    + id             = (known after apply)
    + route_table_id = (known after apply)
    + subnet_id      = (known after apply)
      }

# module.vpc.aws_route_table_association.rt_route_associations["subnet-B"] will be created
+ resource "aws_route_table_association" "rt_route_associations" {
    + id             = (known after apply)
    + route_table_id = (known after apply)
    + subnet_id      = (known after apply)
      }

# module.vpc.aws_subnet.rt_subnets["subnet-A"] will be created
+ resource "aws_subnet" "rt_subnets" {
    + arn                             = (known after apply)
    + assign_ipv6_address_on_creation = false
    + availability_zone               = "us-west-2a"
    + availability_zone_id            = (known after apply)
    + cidr_block                      = "10.0.0.0/22"
    + id                              = (known after apply)
    + ipv6_cidr_block_association_id  = (known after apply)
    + map_public_ip_on_launch         = true
    + owner_id                        = (known after apply)
    + tags                            = {
        + "Environment" = "dev"
        + "Name"        = "subnet-A-dev"
          }
    + tags_all                        = {
        + "Environment" = "dev"
        + "Name"        = "subnet-A-dev"
          }
    + vpc_id                          = (known after apply)
      }

# module.vpc.aws_subnet.rt_subnets["subnet-B"] will be created
+ resource "aws_subnet" "rt_subnets" {
    + arn                             = (known after apply)
    + assign_ipv6_address_on_creation = false
    + availability_zone               = "us-west-2b"
    + availability_zone_id            = (known after apply)
    + cidr_block                      = "10.0.4.0/22"
    + id                              = (known after apply)
    + ipv6_cidr_block_association_id  = (known after apply)
    + map_public_ip_on_launch         = true
    + owner_id                        = (known after apply)
    + tags                            = {
        + "Environment" = "dev"
        + "Name"        = "subnet-B-dev"
          }
    + tags_all                        = {
        + "Environment" = "dev"
        + "Name"        = "subnet-B-dev"
          }
    + vpc_id                          = (known after apply)
      }

# module.vpc.aws_subnet.rt_subnets["subnet-bastion-A"] will be created
+ resource "aws_subnet" "rt_subnets" {
    + arn                             = (known after apply)
    + assign_ipv6_address_on_creation = false
    + availability_zone               = "us-west-2a"
    + availability_zone_id            = (known after apply)
    + cidr_block                      = "10.0.12.0/24"
    + id                              = (known after apply)
    + ipv6_cidr_block_association_id  = (known after apply)
    + map_public_ip_on_launch         = true
    + owner_id                        = (known after apply)
    + tags                            = {
        + "Environment" = "dev"
        + "Name"        = "subnet-bastion-A-dev"
          }
    + tags_all                        = {
        + "Environment" = "dev"
        + "Name"        = "subnet-bastion-A-dev"
          }
    + vpc_id                          = (known after apply)
      }

# module.vpc.aws_subnet.rt_subnets["subnet-db-A"] will be created
+ resource "aws_subnet" "rt_subnets" {
    + arn                             = (known after apply)
    + assign_ipv6_address_on_creation = false
    + availability_zone               = "us-west-2a"
    + availability_zone_id            = (known after apply)
    + cidr_block                      = "10.0.48.0/20"
    + id                              = (known after apply)
    + ipv6_cidr_block_association_id  = (known after apply)
    + map_public_ip_on_launch         = false
    + owner_id                        = (known after apply)
    + tags                            = {
        + "Environment" = "dev"
        + "Name"        = "subnet-db-A-dev"
          }
    + tags_all                        = {
        + "Environment" = "dev"
        + "Name"        = "subnet-db-A-dev"
          }
    + vpc_id                          = (known after apply)
      }

# module.vpc.aws_subnet.rt_subnets["subnet-db-B"] will be created
+ resource "aws_subnet" "rt_subnets" {
    + arn                             = (known after apply)
    + assign_ipv6_address_on_creation = false
    + availability_zone               = "us-west-2b"
    + availability_zone_id            = (known after apply)
    + cidr_block                      = "10.0.64.0/20"
    + id                              = (known after apply)
    + ipv6_cidr_block_association_id  = (known after apply)
    + map_public_ip_on_launch         = false
    + owner_id                        = (known after apply)
    + tags                            = {
        + "Environment" = "dev"
        + "Name"        = "subnet-db-B-dev"
          }
    + tags_all                        = {
        + "Environment" = "dev"
        + "Name"        = "subnet-db-B-dev"
          }
    + vpc_id                          = (known after apply)
      }

# module.vpc.aws_subnet.rt_subnets["subnet-k8-A"] will be created
+ resource "aws_subnet" "rt_subnets" {
    + arn                             = (known after apply)
    + assign_ipv6_address_on_creation = false
    + availability_zone               = "us-west-2a"
    + availability_zone_id            = (known after apply)
    + cidr_block                      = "10.0.20.0/22"
    + id                              = (known after apply)
    + ipv6_cidr_block_association_id  = (known after apply)
    + map_public_ip_on_launch         = false
    + owner_id                        = (known after apply)
    + tags                            = {
        + "Environment" = "dev"
        + "Name"        = "subnet-k8-A-dev"
          }
    + tags_all                        = {
        + "Environment" = "dev"
        + "Name"        = "subnet-k8-A-dev"
          }
    + vpc_id                          = (known after apply)
      }

# module.vpc.aws_subnet.rt_subnets["subnet-k8-B"] will be created
+ resource "aws_subnet" "rt_subnets" {
    + arn                             = (known after apply)
    + assign_ipv6_address_on_creation = false
    + availability_zone               = "us-west-2b"
    + availability_zone_id            = (known after apply)
    + cidr_block                      = "10.0.24.0/22"
    + id                              = (known after apply)
    + ipv6_cidr_block_association_id  = (known after apply)
    + map_public_ip_on_launch         = false
    + owner_id                        = (known after apply)
    + tags                            = {
        + "Environment" = "dev"
        + "Name"        = "subnet-k8-B-dev"
          }
    + tags_all                        = {
        + "Environment" = "dev"
        + "Name"        = "subnet-k8-B-dev"
          }
    + vpc_id                          = (known after apply)
      }

# module.vpc.aws_vpc.rt_vpc will be created
+ resource "aws_vpc" "rt_vpc" {
    + arn                              = (known after apply)
    + assign_generated_ipv6_cidr_block = false
    + cidr_block                       = "10.0.0.0/16"
    + default_network_acl_id           = (known after apply)
    + default_route_table_id           = (known after apply)
    + default_security_group_id        = (known after apply)
    + dhcp_options_id                  = (known after apply)
    + enable_classiclink               = false
    + enable_classiclink_dns_support   = (known after apply)
    + enable_dns_hostnames             = true
    + enable_dns_support               = true
    + id                               = (known after apply)
    + instance_tenancy                 = "default"
    + ipv6_association_id              = (known after apply)
    + ipv6_cidr_block                  = (known after apply)
    + main_route_table_id              = (known after apply)
    + owner_id                         = (known after apply)
    + tags                             = {
        + "Environment" = "dev"
        + "Name"        = "theory-k8s-dev"
          }
    + tags_all                         = {
        + "Environment" = "dev"
        + "Name"        = "theory-k8s-dev"
          }
          }

Plan: 15 to add, 0 to change, 0 to destroy.
```
```terraform
$ terraform plan

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.vpc.aws_default_route_table.route_table will be created
  + resource "aws_default_route_table" "route_table" {
      + arn                    = (known after apply)
      + default_route_table_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + route                  = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags                   = {
          + "Environment" = "dev"
          + "Name"        = "dev-route-table"
        }
      + tags_all               = {
          + "Environment" = "dev"
          + "Name"        = "dev-route-table"
        }
      + vpc_id                 = (known after apply)
    }

  # module.vpc.aws_eip.rt_nat_eip will be created
  + resource "aws_eip" "rt_nat_eip" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = (known after apply)
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-eip"
        }
      + tags_all             = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-eip"
        }
      + vpc                  = true
    }

  # module.vpc.aws_internet_gateway.rt_igw will be created
  + resource "aws_internet_gateway" "rt_igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Environment" = "dev"
          + "Name"        = "dev-igw"
        }
      + tags_all = {
          + "Environment" = "dev"
          + "Name"        = "dev-igw"
        }
      + vpc_id   = (known after apply)
    }

  # module.vpc.aws_nat_gateway.rt_nat_gw will be created
  + resource "aws_nat_gateway" "rt_nat_gw" {
      + allocation_id        = (known after apply)
      + id                   = (known after apply)
      + network_interface_id = (known after apply)
      + private_ip           = (known after apply)
      + public_ip            = (known after apply)
      + subnet_id            = (known after apply)
      + tags                 = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-gw"
        }
      + tags_all             = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-gw"
        }
    }

  # module.vpc.aws_route_table.rt_nat_gw_rt will be created
  + resource "aws_route_table" "rt_nat_gw_rt" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = ""
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = (known after apply)
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-gw-rt"
        }
      + tags_all         = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-gw-rt"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table_association.rt_route_associations["subnet-A"] will be created
  + resource "aws_route_table_association" "rt_route_associations" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.rt_route_associations["subnet-B"] will be created
  + resource "aws_route_table_association" "rt_route_associations" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-A"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.0.0/22"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-A-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-A-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-B"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.4.0/22"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-B-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-B-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-bastion-A"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.12.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-bastion-A-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-bastion-A-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-db-A"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.48.0/20"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-db-A-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-db-A-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-db-B"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.64.0/20"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-db-B-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-db-B-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-k8-A"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.20.0/22"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-k8-A-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-k8-A-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-k8-B"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.24.0/22"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-k8-B-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-k8-B-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_vpc.rt_vpc will be created
  + resource "aws_vpc" "rt_vpc" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.0.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = false
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Environment" = "dev"
          + "Name"        = "theory-k8s-dev"
        }
      + tags_all                         = {
          + "Environment" = "dev"
          + "Name"        = "theory-k8s-dev"
        }
    }

Plan: 15 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee
to take exactly these actions if you run "terraform apply" now.
$ 
$ terraform apply 

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.vpc.aws_default_route_table.route_table will be created
  + resource "aws_default_route_table" "route_table" {
      + arn                    = (known after apply)
      + default_route_table_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + route                  = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags                   = {
          + "Environment" = "dev"
          + "Name"        = "dev-route-table"
        }
      + tags_all               = {
          + "Environment" = "dev"
          + "Name"        = "dev-route-table"
        }
      + vpc_id                 = (known after apply)
    }

  # module.vpc.aws_eip.rt_nat_eip will be created
  + resource "aws_eip" "rt_nat_eip" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = (known after apply)
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-eip"
        }
      + tags_all             = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-eip"
        }
      + vpc                  = true
    }

  # module.vpc.aws_internet_gateway.rt_igw will be created
  + resource "aws_internet_gateway" "rt_igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Environment" = "dev"
          + "Name"        = "dev-igw"
        }
      + tags_all = {
          + "Environment" = "dev"
          + "Name"        = "dev-igw"
        }
      + vpc_id   = (known after apply)
    }

  # module.vpc.aws_nat_gateway.rt_nat_gw will be created
  + resource "aws_nat_gateway" "rt_nat_gw" {
      + allocation_id        = (known after apply)
      + id                   = (known after apply)
      + network_interface_id = (known after apply)
      + private_ip           = (known after apply)
      + public_ip            = (known after apply)
      + subnet_id            = (known after apply)
      + tags                 = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-gw"
        }
      + tags_all             = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-gw"
        }
    }

  # module.vpc.aws_route_table.rt_nat_gw_rt will be created
  + resource "aws_route_table" "rt_nat_gw_rt" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = ""
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = (known after apply)
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-gw-rt"
        }
      + tags_all         = {
          + "Environment" = "dev"
          + "Name"        = "dev-nat-gw-rt"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table_association.rt_route_associations["subnet-A"] will be created
  + resource "aws_route_table_association" "rt_route_associations" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.rt_route_associations["subnet-B"] will be created
  + resource "aws_route_table_association" "rt_route_associations" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-A"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.0.0/22"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-A-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-A-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-B"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.4.0/22"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-B-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-B-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-bastion-A"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.12.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-bastion-A-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-bastion-A-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-db-A"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.48.0/20"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-db-A-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-db-A-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-db-B"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.64.0/20"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-db-B-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-db-B-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-k8-A"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.20.0/22"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-k8-A-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-k8-A-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-k8-B"] will be created
  + resource "aws_subnet" "rt_subnets" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-west-2b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.24.0/22"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "dev"
          + "Name"        = "subnet-k8-B-dev"
        }
      + tags_all                        = {
          + "Environment" = "dev"
          + "Name"        = "subnet-k8-B-dev"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_vpc.rt_vpc will be created
  + resource "aws_vpc" "rt_vpc" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.0.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = false
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Environment" = "dev"
          + "Name"        = "theory-k8s-dev"
        }
      + tags_all                         = {
          + "Environment" = "dev"
          + "Name"        = "theory-k8s-dev"
        }
    }

Plan: 15 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.vpc.aws_vpc.rt_vpc: Creating...
module.vpc.aws_vpc.rt_vpc: Still creating... [10s elapsed]
module.vpc.aws_vpc.rt_vpc: Creation complete after 13s [id=vpc-09fb328b7c89d6ce4]
module.vpc.aws_subnet.rt_subnets["subnet-A"]: Creating...
module.vpc.aws_subnet.rt_subnets["subnet-k8-B"]: Creating...
module.vpc.aws_subnet.rt_subnets["subnet-bastion-A"]: Creating...
module.vpc.aws_subnet.rt_subnets["subnet-db-A"]: Creating...
module.vpc.aws_subnet.rt_subnets["subnet-db-B"]: Creating...
module.vpc.aws_subnet.rt_subnets["subnet-B"]: Creating...
module.vpc.aws_internet_gateway.rt_igw: Creating...
module.vpc.aws_subnet.rt_subnets["subnet-k8-A"]: Creating...
module.vpc.aws_subnet.rt_subnets["subnet-db-A"]: Creation complete after 6s [id=subnet-0d5ca873461ce1c85]
module.vpc.aws_subnet.rt_subnets["subnet-db-B"]: Creation complete after 6s [id=subnet-049fe6a94f91f1a45]
module.vpc.aws_subnet.rt_subnets["subnet-k8-B"]: Creation complete after 6s [id=subnet-03ea7c24f69d37c40]
module.vpc.aws_subnet.rt_subnets["subnet-k8-A"]: Creation complete after 6s [id=subnet-092ab7868569b63cc]
module.vpc.aws_internet_gateway.rt_igw: Creation complete after 7s [id=igw-0f89711c2edd34122]
module.vpc.aws_default_route_table.route_table: Creating...
module.vpc.aws_default_route_table.route_table: Creation complete after 1s [id=rtb-097437eefd03a6bd9]
module.vpc.aws_subnet.rt_subnets["subnet-A"]: Still creating... [10s elapsed]
module.vpc.aws_subnet.rt_subnets["subnet-bastion-A"]: Still creating... [10s elapsed]
module.vpc.aws_subnet.rt_subnets["subnet-B"]: Still creating... [10s elapsed]
module.vpc.aws_subnet.rt_subnets["subnet-bastion-A"]: Creation complete after 17s [id=subnet-00856f18899ec50a1]
module.vpc.aws_subnet.rt_subnets["subnet-A"]: Creation complete after 17s [id=subnet-0160f3798464728fb]
module.vpc.aws_subnet.rt_subnets["subnet-B"]: Creation complete after 17s [id=subnet-068dfeee0039dd9c7]
module.vpc.aws_route_table_association.rt_route_associations["subnet-A"]: Creating...
module.vpc.aws_route_table_association.rt_route_associations["subnet-B"]: Creating...
module.vpc.aws_route_table_association.rt_route_associations["subnet-B"]: Creation complete after 1s [id=rtbassoc-0fd76c770c91de887]
module.vpc.aws_route_table_association.rt_route_associations["subnet-A"]: Creation complete after 2s [id=rtbassoc-028290b93e00c35e6]
module.vpc.aws_eip.rt_nat_eip: Creating...
module.vpc.aws_eip.rt_nat_eip: Creation complete after 2s [id=eipalloc-0a7156b37db201c44]
module.vpc.aws_nat_gateway.rt_nat_gw: Creating...
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [10s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [20s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [30s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [40s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [50s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [1m0s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [1m10s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [1m20s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [1m30s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [1m40s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Creation complete after 1m43s [id=nat-01215517ef62126bb]
module.vpc.aws_route_table.rt_nat_gw_rt: Creating...
module.vpc.aws_route_table.rt_nat_gw_rt: Creation complete after 2s [id=rtb-0972de25fe5d52ac2]

Apply complete! Resources: 15 added, 0 changed, 0 destroyed.
```

```terraform
$ terraform destroy 
module.vpc.aws_vpc.rt_vpc: Refreshing state... [id=vpc-09fb328b7c89d6ce4]
module.vpc.aws_internet_gateway.rt_igw: Refreshing state... [id=igw-0f89711c2edd34122]
module.vpc.aws_subnet.rt_subnets["subnet-db-B"]: Refreshing state... [id=subnet-049fe6a94f91f1a45]
module.vpc.aws_subnet.rt_subnets["subnet-bastion-A"]: Refreshing state... [id=subnet-00856f18899ec50a1]
module.vpc.aws_subnet.rt_subnets["subnet-db-A"]: Refreshing state... [id=subnet-0d5ca873461ce1c85]
module.vpc.aws_subnet.rt_subnets["subnet-A"]: Refreshing state... [id=subnet-0160f3798464728fb]
module.vpc.aws_subnet.rt_subnets["subnet-k8-A"]: Refreshing state... [id=subnet-092ab7868569b63cc]
module.vpc.aws_subnet.rt_subnets["subnet-k8-B"]: Refreshing state... [id=subnet-03ea7c24f69d37c40]
module.vpc.aws_subnet.rt_subnets["subnet-B"]: Refreshing state... [id=subnet-068dfeee0039dd9c7]
module.vpc.aws_default_route_table.route_table: Refreshing state... [id=rtb-097437eefd03a6bd9]
module.vpc.aws_route_table_association.rt_route_associations["subnet-A"]: Refreshing state... [id=rtbassoc-028290b93e00c35e6]
module.vpc.aws_route_table_association.rt_route_associations["subnet-B"]: Refreshing state... [id=rtbassoc-0fd76c770c91de887]
module.vpc.aws_eip.rt_nat_eip: Refreshing state... [id=eipalloc-0a7156b37db201c44]
module.vpc.aws_nat_gateway.rt_nat_gw: Refreshing state... [id=nat-01215517ef62126bb]
module.vpc.aws_route_table.rt_nat_gw_rt: Refreshing state... [id=rtb-0972de25fe5d52ac2]

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.vpc.aws_default_route_table.route_table will be destroyed
  - resource "aws_default_route_table" "route_table" {
      - arn                    = "arn:aws:ec2:us-west-2:581092633589:route-table/rtb-097437eefd03a6bd9" -> null
      - default_route_table_id = "rtb-097437eefd03a6bd9" -> null
      - id                     = "rtb-097437eefd03a6bd9" -> null
      - owner_id               = "581092633589" -> null
      - propagating_vgws       = [] -> null
      - route                  = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - destination_prefix_list_id = ""
              - egress_only_gateway_id     = ""
              - gateway_id                 = "igw-0f89711c2edd34122"
              - instance_id                = ""
              - ipv6_cidr_block            = ""
              - nat_gateway_id             = ""
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
        ] -> null
      - tags                   = {
          - "Environment" = "dev"
          - "Name"        = "dev-route-table"
        } -> null
      - tags_all               = {
          - "Environment" = "dev"
          - "Name"        = "dev-route-table"
        } -> null
      - vpc_id                 = "vpc-09fb328b7c89d6ce4" -> null
    }

  # module.vpc.aws_eip.rt_nat_eip will be destroyed
  - resource "aws_eip" "rt_nat_eip" {
      - association_id       = "eipassoc-049efc28de1f3f7ad" -> null
      - domain               = "vpc" -> null
      - id                   = "eipalloc-0a7156b37db201c44" -> null
      - network_border_group = "us-west-2" -> null
      - network_interface    = "eni-07b13edb40af956d5" -> null
      - private_dns          = "ip-10-0-4-57.us-west-2.compute.internal" -> null
      - private_ip           = "10.0.4.57" -> null
      - public_dns           = "ec2-44-238-119-19.us-west-2.compute.amazonaws.com" -> null
      - public_ip            = "44.238.119.19" -> null
      - public_ipv4_pool     = "amazon" -> null
      - tags                 = {
          - "Environment" = "dev"
          - "Name"        = "dev-nat-eip"
        } -> null
      - tags_all             = {
          - "Environment" = "dev"
          - "Name"        = "dev-nat-eip"
        } -> null
      - vpc                  = true -> null
    }

  # module.vpc.aws_internet_gateway.rt_igw will be destroyed
  - resource "aws_internet_gateway" "rt_igw" {
      - arn      = "arn:aws:ec2:us-west-2:581092633589:internet-gateway/igw-0f89711c2edd34122" -> null
      - id       = "igw-0f89711c2edd34122" -> null
      - owner_id = "581092633589" -> null
      - tags     = {
          - "Environment" = "dev"
          - "Name"        = "dev-igw"
        } -> null
      - tags_all = {
          - "Environment" = "dev"
          - "Name"        = "dev-igw"
        } -> null
      - vpc_id   = "vpc-09fb328b7c89d6ce4" -> null
    }

  # module.vpc.aws_nat_gateway.rt_nat_gw will be destroyed
  - resource "aws_nat_gateway" "rt_nat_gw" {
      - allocation_id        = "eipalloc-0a7156b37db201c44" -> null
      - id                   = "nat-01215517ef62126bb" -> null
      - network_interface_id = "eni-07b13edb40af956d5" -> null
      - private_ip           = "10.0.4.57" -> null
      - public_ip            = "44.238.119.19" -> null
      - subnet_id            = "subnet-068dfeee0039dd9c7" -> null
      - tags                 = {
          - "Environment" = "dev"
          - "Name"        = "dev-nat-gw"
        } -> null
      - tags_all             = {
          - "Environment" = "dev"
          - "Name"        = "dev-nat-gw"
        } -> null
    }

  # module.vpc.aws_route_table.rt_nat_gw_rt will be destroyed
  - resource "aws_route_table" "rt_nat_gw_rt" {
      - arn              = "arn:aws:ec2:us-west-2:581092633589:route-table/rtb-0972de25fe5d52ac2" -> null
      - id               = "rtb-0972de25fe5d52ac2" -> null
      - owner_id         = "581092633589" -> null
      - propagating_vgws = [] -> null
      - route            = [
          - {
              - carrier_gateway_id         = ""
              - cidr_block                 = "0.0.0.0/0"
              - destination_prefix_list_id = ""
              - egress_only_gateway_id     = ""
              - gateway_id                 = ""
              - instance_id                = ""
              - ipv6_cidr_block            = ""
              - local_gateway_id           = ""
              - nat_gateway_id             = "nat-01215517ef62126bb"
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
        ] -> null
      - tags             = {
          - "Environment" = "dev"
          - "Name"        = "dev-nat-gw-rt"
        } -> null
      - tags_all         = {
          - "Environment" = "dev"
          - "Name"        = "dev-nat-gw-rt"
        } -> null
      - vpc_id           = "vpc-09fb328b7c89d6ce4" -> null
    }

  # module.vpc.aws_route_table_association.rt_route_associations["subnet-A"] will be destroyed
  - resource "aws_route_table_association" "rt_route_associations" {
      - id             = "rtbassoc-028290b93e00c35e6" -> null
      - route_table_id = "rtb-097437eefd03a6bd9" -> null
      - subnet_id      = "subnet-0160f3798464728fb" -> null
    }

  # module.vpc.aws_route_table_association.rt_route_associations["subnet-B"] will be destroyed
  - resource "aws_route_table_association" "rt_route_associations" {
      - id             = "rtbassoc-0fd76c770c91de887" -> null
      - route_table_id = "rtb-097437eefd03a6bd9" -> null
      - subnet_id      = "subnet-068dfeee0039dd9c7" -> null
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-A"] will be destroyed
  - resource "aws_subnet" "rt_subnets" {
      - arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-0160f3798464728fb" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "us-west-2a" -> null
      - availability_zone_id            = "usw2-az1" -> null
      - cidr_block                      = "10.0.0.0/22" -> null
      - id                              = "subnet-0160f3798464728fb" -> null
      - map_customer_owned_ip_on_launch = false -> null
      - map_public_ip_on_launch         = true -> null
      - owner_id                        = "581092633589" -> null
      - tags                            = {
          - "Environment" = "dev"
          - "Name"        = "subnet-A-dev"
        } -> null
      - tags_all                        = {
          - "Environment" = "dev"
          - "Name"        = "subnet-A-dev"
        } -> null
      - vpc_id                          = "vpc-09fb328b7c89d6ce4" -> null
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-B"] will be destroyed
  - resource "aws_subnet" "rt_subnets" {
      - arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-068dfeee0039dd9c7" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "us-west-2b" -> null
      - availability_zone_id            = "usw2-az2" -> null
      - cidr_block                      = "10.0.4.0/22" -> null
      - id                              = "subnet-068dfeee0039dd9c7" -> null
      - map_customer_owned_ip_on_launch = false -> null
      - map_public_ip_on_launch         = true -> null
      - owner_id                        = "581092633589" -> null
      - tags                            = {
          - "Environment" = "dev"
          - "Name"        = "subnet-B-dev"
        } -> null
      - tags_all                        = {
          - "Environment" = "dev"
          - "Name"        = "subnet-B-dev"
        } -> null
      - vpc_id                          = "vpc-09fb328b7c89d6ce4" -> null
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-bastion-A"] will be destroyed
  - resource "aws_subnet" "rt_subnets" {
      - arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-00856f18899ec50a1" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "us-west-2a" -> null
      - availability_zone_id            = "usw2-az1" -> null
      - cidr_block                      = "10.0.12.0/24" -> null
      - id                              = "subnet-00856f18899ec50a1" -> null
      - map_customer_owned_ip_on_launch = false -> null
      - map_public_ip_on_launch         = true -> null
      - owner_id                        = "581092633589" -> null
      - tags                            = {
          - "Environment" = "dev"
          - "Name"        = "subnet-bastion-A-dev"
        } -> null
      - tags_all                        = {
          - "Environment" = "dev"
          - "Name"        = "subnet-bastion-A-dev"
        } -> null
      - vpc_id                          = "vpc-09fb328b7c89d6ce4" -> null
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-db-A"] will be destroyed
  - resource "aws_subnet" "rt_subnets" {
      - arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-0d5ca873461ce1c85" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "us-west-2a" -> null
      - availability_zone_id            = "usw2-az1" -> null
      - cidr_block                      = "10.0.48.0/20" -> null
      - id                              = "subnet-0d5ca873461ce1c85" -> null
      - map_customer_owned_ip_on_launch = false -> null
      - map_public_ip_on_launch         = false -> null
      - owner_id                        = "581092633589" -> null
      - tags                            = {
          - "Environment" = "dev"
          - "Name"        = "subnet-db-A-dev"
        } -> null
      - tags_all                        = {
          - "Environment" = "dev"
          - "Name"        = "subnet-db-A-dev"
        } -> null
      - vpc_id                          = "vpc-09fb328b7c89d6ce4" -> null
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-db-B"] will be destroyed
  - resource "aws_subnet" "rt_subnets" {
      - arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-049fe6a94f91f1a45" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "us-west-2b" -> null
      - availability_zone_id            = "usw2-az2" -> null
      - cidr_block                      = "10.0.64.0/20" -> null
      - id                              = "subnet-049fe6a94f91f1a45" -> null
      - map_customer_owned_ip_on_launch = false -> null
      - map_public_ip_on_launch         = false -> null
      - owner_id                        = "581092633589" -> null
      - tags                            = {
          - "Environment" = "dev"
          - "Name"        = "subnet-db-B-dev"
        } -> null
      - tags_all                        = {
          - "Environment" = "dev"
          - "Name"        = "subnet-db-B-dev"
        } -> null
      - vpc_id                          = "vpc-09fb328b7c89d6ce4" -> null
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-k8-A"] will be destroyed
  - resource "aws_subnet" "rt_subnets" {
      - arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-092ab7868569b63cc" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "us-west-2a" -> null
      - availability_zone_id            = "usw2-az1" -> null
      - cidr_block                      = "10.0.20.0/22" -> null
      - id                              = "subnet-092ab7868569b63cc" -> null
      - map_customer_owned_ip_on_launch = false -> null
      - map_public_ip_on_launch         = false -> null
      - owner_id                        = "581092633589" -> null
      - tags                            = {
          - "Environment" = "dev"
          - "Name"        = "subnet-k8-A-dev"
        } -> null
      - tags_all                        = {
          - "Environment" = "dev"
          - "Name"        = "subnet-k8-A-dev"
        } -> null
      - vpc_id                          = "vpc-09fb328b7c89d6ce4" -> null
    }

  # module.vpc.aws_subnet.rt_subnets["subnet-k8-B"] will be destroyed
  - resource "aws_subnet" "rt_subnets" {
      - arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-03ea7c24f69d37c40" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "us-west-2b" -> null
      - availability_zone_id            = "usw2-az2" -> null
      - cidr_block                      = "10.0.24.0/22" -> null
      - id                              = "subnet-03ea7c24f69d37c40" -> null
      - map_customer_owned_ip_on_launch = false -> null
      - map_public_ip_on_launch         = false -> null
      - owner_id                        = "581092633589" -> null
      - tags                            = {
          - "Environment" = "dev"
          - "Name"        = "subnet-k8-B-dev"
        } -> null
      - tags_all                        = {
          - "Environment" = "dev"
          - "Name"        = "subnet-k8-B-dev"
        } -> null
      - vpc_id                          = "vpc-09fb328b7c89d6ce4" -> null
    }

  # module.vpc.aws_vpc.rt_vpc will be destroyed
  - resource "aws_vpc" "rt_vpc" {
      - arn                              = "arn:aws:ec2:us-west-2:581092633589:vpc/vpc-09fb328b7c89d6ce4" -> null
      - assign_generated_ipv6_cidr_block = false -> null
      - cidr_block                       = "10.0.0.0/16" -> null
      - default_network_acl_id           = "acl-0e3e15dbdb8e5e05f" -> null
      - default_route_table_id           = "rtb-097437eefd03a6bd9" -> null
      - default_security_group_id        = "sg-0bbe0ab9dac93946c" -> null
      - dhcp_options_id                  = "dopt-0b6419aaeaa4f9f20" -> null
      - enable_classiclink               = false -> null
      - enable_classiclink_dns_support   = false -> null
      - enable_dns_hostnames             = true -> null
      - enable_dns_support               = true -> null
      - id                               = "vpc-09fb328b7c89d6ce4" -> null
      - instance_tenancy                 = "default" -> null
      - main_route_table_id              = "rtb-097437eefd03a6bd9" -> null
      - owner_id                         = "581092633589" -> null
      - tags                             = {
          - "Environment" = "dev"
          - "Name"        = "theory-k8s-dev"
        } -> null
      - tags_all                         = {
          - "Environment" = "dev"
          - "Name"        = "theory-k8s-dev"
        } -> null
    }

Plan: 0 to add, 0 to change, 15 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

module.vpc.aws_route_table.rt_nat_gw_rt: Destroying... [id=rtb-0972de25fe5d52ac2]
module.vpc.aws_route_table.rt_nat_gw_rt: Destruction complete after 7s
module.vpc.aws_nat_gateway.rt_nat_gw: Destroying... [id=nat-01215517ef62126bb]
module.vpc.aws_nat_gateway.rt_nat_gw: Still destroying... [id=nat-01215517ef62126bb, 10s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still destroying... [id=nat-01215517ef62126bb, 20s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still destroying... [id=nat-01215517ef62126bb, 30s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still destroying... [id=nat-01215517ef62126bb, 40s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still destroying... [id=nat-01215517ef62126bb, 50s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still destroying... [id=nat-01215517ef62126bb, 1m0s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Destruction complete after 1m2s
module.vpc.aws_eip.rt_nat_eip: Destroying... [id=eipalloc-0a7156b37db201c44]
module.vpc.aws_eip.rt_nat_eip: Destruction complete after 1s
module.vpc.aws_route_table_association.rt_route_associations["subnet-A"]: Destroying... [id=rtbassoc-028290b93e00c35e6]
module.vpc.aws_route_table_association.rt_route_associations["subnet-B"]: Destroying... [id=rtbassoc-0fd76c770c91de887]
module.vpc.aws_route_table_association.rt_route_associations["subnet-A"]: Destruction complete after 0s
module.vpc.aws_route_table_association.rt_route_associations["subnet-B"]: Destruction complete after 0s
module.vpc.aws_default_route_table.route_table: Destroying... [id=rtb-097437eefd03a6bd9]
module.vpc.aws_subnet.rt_subnets["subnet-B"]: Destroying... [id=subnet-068dfeee0039dd9c7]
module.vpc.aws_subnet.rt_subnets["subnet-db-A"]: Destroying... [id=subnet-0d5ca873461ce1c85]
module.vpc.aws_subnet.rt_subnets["subnet-bastion-A"]: Destroying... [id=subnet-00856f18899ec50a1]
module.vpc.aws_subnet.rt_subnets["subnet-A"]: Destroying... [id=subnet-0160f3798464728fb]
module.vpc.aws_subnet.rt_subnets["subnet-k8-A"]: Destroying... [id=subnet-092ab7868569b63cc]
module.vpc.aws_subnet.rt_subnets["subnet-db-B"]: Destroying... [id=subnet-049fe6a94f91f1a45]
module.vpc.aws_subnet.rt_subnets["subnet-k8-B"]: Destroying... [id=subnet-03ea7c24f69d37c40]
module.vpc.aws_default_route_table.route_table: Destruction complete after 0s
module.vpc.aws_internet_gateway.rt_igw: Destroying... [id=igw-0f89711c2edd34122]
module.vpc.aws_subnet.rt_subnets["subnet-db-B"]: Destruction complete after 2s
module.vpc.aws_subnet.rt_subnets["subnet-k8-B"]: Destruction complete after 2s
module.vpc.aws_subnet.rt_subnets["subnet-A"]: Destruction complete after 2s
module.vpc.aws_subnet.rt_subnets["subnet-B"]: Destruction complete after 3s
module.vpc.aws_subnet.rt_subnets["subnet-bastion-A"]: Destruction complete after 3s
module.vpc.aws_subnet.rt_subnets["subnet-k8-A"]: Destruction complete after 3s
module.vpc.aws_subnet.rt_subnets["subnet-db-A"]: Destruction complete after 3s
module.vpc.aws_internet_gateway.rt_igw: Still destroying... [id=igw-0f89711c2edd34122, 10s elapsed]
module.vpc.aws_internet_gateway.rt_igw: Destruction complete after 11s
module.vpc.aws_vpc.rt_vpc: Destroying... [id=vpc-09fb328b7c89d6ce4]
module.vpc.aws_vpc.rt_vpc: Destruction complete after 1s

Destroy complete! Resources: 15 destroyed.

```
