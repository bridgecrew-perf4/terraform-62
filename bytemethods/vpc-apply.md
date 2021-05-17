
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_default_route_table.route_table will be created
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
          + "Environment" = "research"
          + "Name"        = "route-table"
        }
      + tags_all               = {
          + "Environment" = "research"
          + "Name"        = "route-table"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_eip.research_nat_eip will be created
  + resource "aws_eip" "research_nat_eip" {
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
      + tags_all             = (known after apply)
      + vpc                  = true
    }

  # aws_internet_gateway.research_igw will be created
  + resource "aws_internet_gateway" "research_igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Environment" = "research"
          + "Name"        = "internet-gateway"
        }
      + tags_all = {
          + "Environment" = "research"
          + "Name"        = "internet-gateway"
        }
      + vpc_id   = (known after apply)
    }

  # aws_nat_gateway.research_nat_gw will be created
  + resource "aws_nat_gateway" "research_nat_gw" {
      + allocation_id        = (known after apply)
      + id                   = (known after apply)
      + network_interface_id = (known after apply)
      + private_ip           = (known after apply)
      + public_ip            = (known after apply)
      + subnet_id            = (known after apply)
      + tags                 = {
          + "Name" = "research-nat-gw"
        }
      + tags_all             = {
          + "Name" = "research-nat-gw"
        }
    }

  # aws_route_table.research_nat_gw_rt will be created
  + resource "aws_route_table" "research_nat_gw_rt" {
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
          + "Name" = "Route Table for NAT Gateway"
        }
      + tags_all         = {
          + "Name" = "Route Table for NAT Gateway"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.DB_A will be created
  + resource "aws_route_table_association" "DB_A" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.DB_B will be created
  + resource "aws_route_table_association" "DB_B" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.k8s_A will be created
  + resource "aws_route_table_association" "k8s_A" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.k8s_B will be created
  + resource "aws_route_table_association" "k8s_B" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_subnet.research_subnet_bastion_A will be created
  + resource "aws_subnet" "research_subnet_bastion_A" {
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
          + "Environment" = "research"
          + "Name"        = "research-subnet-bastion-A"
        }
      + tags_all                        = {
          + "Environment" = "research"
          + "Name"        = "research-subnet-bastion-A"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.research_subnet_db_A will be created
  + resource "aws_subnet" "research_subnet_db_A" {
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
          + "Environment" = "research"
          + "Name"        = "research-subnet-db-A"
        }
      + tags_all                        = {
          + "Environment" = "research"
          + "Name"        = "research-subnet-db-A"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.research_subnet_db_B will be created
  + resource "aws_subnet" "research_subnet_db_B" {
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
          + "Environment" = "research"
          + "Name"        = "research-subnet-db-B"
        }
      + tags_all                        = {
          + "Environment" = "research"
          + "Name"        = "research-subnet-db-B"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.research_subnet_k8s_A will be created
  + resource "aws_subnet" "research_subnet_k8s_A" {
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
          + "Environment" = "research"
          + "Name"        = "research-subnet-k8s-A"
        }
      + tags_all                        = {
          + "Environment" = "research"
          + "Name"        = "research-subnet-k8s-A"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.research_subnet_k8s_B will be created
  + resource "aws_subnet" "research_subnet_k8s_B" {
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
          + "Environment" = "research"
          + "Name"        = "research-subnet-k8s-B"
        }
      + tags_all                        = {
          + "Environment" = "research"
          + "Name"        = "research-subnet-k8s-B"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.research_subnet_public_A will be created
  + resource "aws_subnet" "research_subnet_public_A" {
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
          + "Environment" = "research"
          + "Name"        = "research-subnet-public-A"
        }
      + tags_all                        = {
          + "Environment" = "research"
          + "Name"        = "research-subnet-public-A"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.research_subnet_public_B will be created
  + resource "aws_subnet" "research_subnet_public_B" {
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
          + "Environment" = "research"
          + "Name"        = "research-subnet-public-B"
        }
      + tags_all                        = {
          + "Environment" = "research"
          + "Name"        = "research-subnet-public-B"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.research_vpc will be created
  + resource "aws_vpc" "research_vpc" {
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
          + "Environment" = "research"
          + "Name"        = "theory-k8s-research"
        }
      + tags_all                         = {
          + "Environment" = "research"
          + "Name"        = "theory-k8s-research"
        }
    }

Plan: 17 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_vpc.research_vpc: Creating...
aws_vpc.research_vpc: Still creating... [10s elapsed]
aws_vpc.research_vpc: Creation complete after 12s [id=vpc-0efa23c55e0a044c4]
aws_subnet.research_subnet_k8s_A: Creating...
aws_subnet.research_subnet_public_B: Creating...
aws_subnet.research_subnet_public_A: Creating...
aws_internet_gateway.research_igw: Creating...
aws_subnet.research_subnet_db_A: Creating...
aws_subnet.research_subnet_db_B: Creating...
aws_subnet.research_subnet_bastion_A: Creating...
aws_subnet.research_subnet_k8s_B: Creating...
aws_subnet.research_subnet_k8s_A: Creation complete after 1s [id=subnet-034243cd6c226d83c]
aws_subnet.research_subnet_k8s_B: Creation complete after 1s [id=subnet-0da053d5df13649f8]
aws_subnet.research_subnet_db_B: Creation complete after 1s [id=subnet-053c4c51efe00ff3c]
aws_subnet.research_subnet_db_A: Creation complete after 1s [id=subnet-0588620f7f26736f0]
aws_internet_gateway.research_igw: Creation complete after 1s [id=igw-04aeca56618b2f9d7]
aws_default_route_table.route_table: Creating...
aws_default_route_table.route_table: Creation complete after 1s [id=rtb-061390f159ede7f74]
aws_route_table_association.DB_B: Creating...
aws_route_table_association.k8s_A: Creating...
aws_route_table_association.k8s_B: Creating...
aws_route_table_association.DB_A: Creating...
aws_route_table_association.DB_A: Creation complete after 0s [id=rtbassoc-0b2ffcf009a04b571]
aws_route_table_association.k8s_B: Creation complete after 0s [id=rtbassoc-00e2a41d0e834d075]
aws_route_table_association.k8s_A: Creation complete after 0s [id=rtbassoc-0d3f57d636e0d3eb0]
aws_eip.research_nat_eip: Creating...
aws_route_table_association.DB_B: Creation complete after 0s [id=rtbassoc-05b93937d20f22e57]
aws_eip.research_nat_eip: Creation complete after 0s [id=eipalloc-0a24fd6f5142560b9]
aws_nat_gateway.research_nat_gw: Creating...
aws_subnet.research_subnet_public_B: Still creating... [10s elapsed]
aws_subnet.research_subnet_public_A: Still creating... [10s elapsed]
aws_subnet.research_subnet_bastion_A: Still creating... [10s elapsed]
aws_subnet.research_subnet_public_B: Creation complete after 11s [id=subnet-0c1418856f4d94899]
aws_subnet.research_subnet_bastion_A: Creation complete after 11s [id=subnet-0850e0b0e57e83ebc]
aws_subnet.research_subnet_public_A: Creation complete after 11s [id=subnet-058616e37e52d79cd]
aws_nat_gateway.research_nat_gw: Still creating... [10s elapsed]
aws_nat_gateway.research_nat_gw: Still creating... [20s elapsed]
aws_nat_gateway.research_nat_gw: Still creating... [30s elapsed]
aws_nat_gateway.research_nat_gw: Still creating... [40s elapsed]
aws_nat_gateway.research_nat_gw: Still creating... [50s elapsed]
aws_nat_gateway.research_nat_gw: Still creating... [1m0s elapsed]
aws_nat_gateway.research_nat_gw: Still creating... [1m10s elapsed]
aws_nat_gateway.research_nat_gw: Still creating... [1m20s elapsed]
aws_nat_gateway.research_nat_gw: Still creating... [1m30s elapsed]
aws_nat_gateway.research_nat_gw: Still creating... [1m40s elapsed]
aws_nat_gateway.research_nat_gw: Creation complete after 1m45s [id=nat-06ba6e2d1f06210bf]
aws_route_table.research_nat_gw_rt: Creating...
aws_route_table.research_nat_gw_rt: Creation complete after 1s [id=rtb-0b89948dea11c1e93]

