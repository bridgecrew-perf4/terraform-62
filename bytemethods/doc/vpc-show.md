# terraform show
# aws_default_route_table.route_table:

```json
resource "aws_default_route_table" "route_table" {
    arn                    = "arn:aws:ec2:us-west-2:581092633589:route-table/rtb-061390f159ede7f74"
    default_route_table_id = "rtb-061390f159ede7f74"
    id                     = "rtb-061390f159ede7f74"
    owner_id               = "581092633589"
    route                  = [
        {
            cidr_block                 = "0.0.0.0/0"
            destination_prefix_list_id = ""
            egress_only_gateway_id     = ""
            gateway_id                 = "igw-04aeca56618b2f9d7"
            instance_id                = ""
            ipv6_cidr_block            = ""
            nat_gateway_id             = ""
            network_interface_id       = ""
            transit_gateway_id         = ""
            vpc_endpoint_id            = ""
            vpc_peering_connection_id  = ""
        },
    ]
    tags                   = {
        "Environment" = "research"
        "Name"        = "route-table"
    }
    tags_all               = {
        "Environment" = "research"
        "Name"        = "route-table"
    }
    vpc_id                 = "vpc-0efa23c55e0a044c4"
}
```

# aws_eip.research_nat_eip:
resource "aws_eip" "research_nat_eip" {
    domain               = "vpc"
    id                   = "eipalloc-0a24fd6f5142560b9"
    network_border_group = "us-west-2"
    public_dns           = "ec2-52-35-207-168.us-west-2.compute.amazonaws.com"
    public_ip            = "52.35.207.168"
    public_ipv4_pool     = "amazon"
    tags_all             = {}
    vpc                  = true
}

# aws_internet_gateway.research_igw:
resource "aws_internet_gateway" "research_igw" {
    arn      = "arn:aws:ec2:us-west-2:581092633589:internet-gateway/igw-04aeca56618b2f9d7"
    id       = "igw-04aeca56618b2f9d7"
    owner_id = "581092633589"
    tags     = {
        "Environment" = "research"
        "Name"        = "internet-gateway"
    }
    tags_all = {
        "Environment" = "research"
        "Name"        = "internet-gateway"
    }
    vpc_id   = "vpc-0efa23c55e0a044c4"
}

# aws_nat_gateway.research_nat_gw:
resource "aws_nat_gateway" "research_nat_gw" {
    allocation_id        = "eipalloc-0a24fd6f5142560b9"
    id                   = "nat-06ba6e2d1f06210bf"
    network_interface_id = "eni-0fb15f4ad93dfd7b2"
    private_ip           = "10.0.21.213"
    public_ip            = "52.35.207.168"
    subnet_id            = "subnet-034243cd6c226d83c"
    tags                 = {
        "Name" = "research-nat-gw"
    }
    tags_all             = {
        "Name" = "research-nat-gw"
    }
}

# aws_route_table.research_nat_gw_rt:
resource "aws_route_table" "research_nat_gw_rt" {
    arn              = "arn:aws:ec2:us-west-2:581092633589:route-table/rtb-0b89948dea11c1e93"
    id               = "rtb-0b89948dea11c1e93"
    owner_id         = "581092633589"
    propagating_vgws = []
    route            = [
        {
            carrier_gateway_id         = ""
            cidr_block                 = "0.0.0.0/0"
            destination_prefix_list_id = ""
            egress_only_gateway_id     = ""
            gateway_id                 = ""
            instance_id                = ""
            ipv6_cidr_block            = ""
            local_gateway_id           = ""
            nat_gateway_id             = "nat-06ba6e2d1f06210bf"
            network_interface_id       = ""
            transit_gateway_id         = ""
            vpc_endpoint_id            = ""
            vpc_peering_connection_id  = ""
        },
    ]
    tags             = {
        "Name" = "Route Table for NAT Gateway"
    }
    tags_all         = {
        "Name" = "Route Table for NAT Gateway"
    }
    vpc_id           = "vpc-0efa23c55e0a044c4"
}

# aws_route_table_association.DB_A:
resource "aws_route_table_association" "DB_A" {
    id             = "rtbassoc-0b2ffcf009a04b571"
    route_table_id = "rtb-061390f159ede7f74"
    subnet_id      = "subnet-0588620f7f26736f0"
}

# aws_route_table_association.DB_B:
resource "aws_route_table_association" "DB_B" {
    id             = "rtbassoc-05b93937d20f22e57"
    route_table_id = "rtb-061390f159ede7f74"
    subnet_id      = "subnet-053c4c51efe00ff3c"
}

# aws_route_table_association.k8s_A:
resource "aws_route_table_association" "k8s_A" {
    id             = "rtbassoc-0d3f57d636e0d3eb0"
    route_table_id = "rtb-061390f159ede7f74"
    subnet_id      = "subnet-034243cd6c226d83c"
}

# aws_route_table_association.k8s_B:
resource "aws_route_table_association" "k8s_B" {
    id             = "rtbassoc-00e2a41d0e834d075"
    route_table_id = "rtb-061390f159ede7f74"
    subnet_id      = "subnet-0da053d5df13649f8"
}

# aws_subnet.research_subnet_bastion_A:
resource "aws_subnet" "research_subnet_bastion_A" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-0850e0b0e57e83ebc"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2a"
    availability_zone_id            = "usw2-az1"
    cidr_block                      = "10.0.12.0/24"
    id                              = "subnet-0850e0b0e57e83ebc"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = true
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-bastion-A"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-bastion-A"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_db_A:
resource "aws_subnet" "research_subnet_db_A" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-0588620f7f26736f0"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2a"
    availability_zone_id            = "usw2-az1"
    cidr_block                      = "10.0.48.0/20"
    id                              = "subnet-0588620f7f26736f0"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = false
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-db-A"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-db-A"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_db_B:
resource "aws_subnet" "research_subnet_db_B" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-053c4c51efe00ff3c"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2b"
    availability_zone_id            = "usw2-az2"
    cidr_block                      = "10.0.64.0/20"
    id                              = "subnet-053c4c51efe00ff3c"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = false
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-db-B"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-db-B"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_k8s_A:
resource "aws_subnet" "research_subnet_k8s_A" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-034243cd6c226d83c"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2a"
    availability_zone_id            = "usw2-az1"
    cidr_block                      = "10.0.20.0/22"
    id                              = "subnet-034243cd6c226d83c"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = false
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-k8s-A"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-k8s-A"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_k8s_B:
resource "aws_subnet" "research_subnet_k8s_B" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-0da053d5df13649f8"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2b"
    availability_zone_id            = "usw2-az2"
    cidr_block                      = "10.0.24.0/22"
    id                              = "subnet-0da053d5df13649f8"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = false
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-k8s-B"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-k8s-B"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_public_A:
resource "aws_subnet" "research_subnet_public_A" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-058616e37e52d79cd"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2a"
    availability_zone_id            = "usw2-az1"
    cidr_block                      = "10.0.0.0/22"
    id                              = "subnet-058616e37e52d79cd"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = true
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-public-A"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-public-A"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_public_B:
resource "aws_subnet" "research_subnet_public_B" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-0c1418856f4d94899"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2b"
    availability_zone_id            = "usw2-az2"
    cidr_block                      = "10.0.4.0/22"
    id                              = "subnet-0c1418856f4d94899"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = true
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-public-B"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-public-B"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_vpc.research_vpc:
resource "aws_vpc" "research_vpc" {
    arn                              = "arn:aws:ec2:us-west-2:581092633589:vpc/vpc-0efa23c55e0a044c4"
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "10.0.0.0/16"
    default_network_acl_id           = "acl-081ecee08d8a12827"
    default_route_table_id           = "rtb-061390f159ede7f74"
    default_security_group_id        = "sg-01d1d3691335b21e4"
    dhcp_options_id                  = "dopt-0b6419aaeaa4f9f20"
    enable_classiclink               = false
    enable_classiclink_dns_support   = false
    enable_dns_hostnames             = true
    enable_dns_support               = true
    id                               = "vpc-0efa23c55e0a044c4"
    instance_tenancy                 = "default"
    main_route_table_id              = "rtb-061390f159ede7f74"
    owner_id                         = "581092633589"
    tags                             = {
        "Environment" = "research"
        "Name"        = "theory-k8s-research"
    }
    tags_all                         = {
        "Environment" = "research"
        "Name"        = "theory-k8s-research"
    }
}
$ 
$ terraform show
# aws_default_route_table.route_table:
resource "aws_default_route_table" "route_table" {
    arn                    = "arn:aws:ec2:us-west-2:581092633589:route-table/rtb-061390f159ede7f74"
    default_route_table_id = "rtb-061390f159ede7f74"
    id                     = "rtb-061390f159ede7f74"
    owner_id               = "581092633589"
    route                  = [
        {
            cidr_block                 = "0.0.0.0/0"
            destination_prefix_list_id = ""
            egress_only_gateway_id     = ""
            gateway_id                 = "igw-04aeca56618b2f9d7"
            instance_id                = ""
            ipv6_cidr_block            = ""
            nat_gateway_id             = ""
            network_interface_id       = ""
            transit_gateway_id         = ""
            vpc_endpoint_id            = ""
            vpc_peering_connection_id  = ""
        },
    ]
    tags                   = {
        "Environment" = "research"
        "Name"        = "route-table"
    }
    tags_all               = {
        "Environment" = "research"
        "Name"        = "route-table"
    }
    vpc_id                 = "vpc-0efa23c55e0a044c4"
}

# aws_eip.research_nat_eip:
resource "aws_eip" "research_nat_eip" {
    domain               = "vpc"
    id                   = "eipalloc-0a24fd6f5142560b9"
    network_border_group = "us-west-2"
    public_dns           = "ec2-52-35-207-168.us-west-2.compute.amazonaws.com"
    public_ip            = "52.35.207.168"
    public_ipv4_pool     = "amazon"
    tags_all             = {}
    vpc                  = true
}

# aws_internet_gateway.research_igw:
resource "aws_internet_gateway" "research_igw" {
    arn      = "arn:aws:ec2:us-west-2:581092633589:internet-gateway/igw-04aeca56618b2f9d7"
    id       = "igw-04aeca56618b2f9d7"
    owner_id = "581092633589"
    tags     = {
        "Environment" = "research"
        "Name"        = "internet-gateway"
    }
    tags_all = {
        "Environment" = "research"
        "Name"        = "internet-gateway"
    }
    vpc_id   = "vpc-0efa23c55e0a044c4"
}

# aws_nat_gateway.research_nat_gw:
resource "aws_nat_gateway" "research_nat_gw" {
    allocation_id        = "eipalloc-0a24fd6f5142560b9"
    id                   = "nat-06ba6e2d1f06210bf"
    network_interface_id = "eni-0fb15f4ad93dfd7b2"
    private_ip           = "10.0.21.213"
    public_ip            = "52.35.207.168"
    subnet_id            = "subnet-034243cd6c226d83c"
    tags                 = {
        "Name" = "research-nat-gw"
    }
    tags_all             = {
        "Name" = "research-nat-gw"
    }
}

# aws_route_table.research_nat_gw_rt:
resource "aws_route_table" "research_nat_gw_rt" {
    arn              = "arn:aws:ec2:us-west-2:581092633589:route-table/rtb-0b89948dea11c1e93"
    id               = "rtb-0b89948dea11c1e93"
    owner_id         = "581092633589"
    propagating_vgws = []
    route            = [
        {
            carrier_gateway_id         = ""
            cidr_block                 = "0.0.0.0/0"
            destination_prefix_list_id = ""
            egress_only_gateway_id     = ""
            gateway_id                 = ""
            instance_id                = ""
            ipv6_cidr_block            = ""
            local_gateway_id           = ""
            nat_gateway_id             = "nat-06ba6e2d1f06210bf"
            network_interface_id       = ""
            transit_gateway_id         = ""
            vpc_endpoint_id            = ""
            vpc_peering_connection_id  = ""
        },
    ]
    tags             = {
        "Name" = "Route Table for NAT Gateway"
    }
    tags_all         = {
        "Name" = "Route Table for NAT Gateway"
    }
    vpc_id           = "vpc-0efa23c55e0a044c4"
}

# aws_route_table_association.DB_A:
resource "aws_route_table_association" "DB_A" {
    id             = "rtbassoc-0b2ffcf009a04b571"
    route_table_id = "rtb-061390f159ede7f74"
    subnet_id      = "subnet-0588620f7f26736f0"
}

# aws_route_table_association.DB_B:
resource "aws_route_table_association" "DB_B" {
    id             = "rtbassoc-05b93937d20f22e57"
    route_table_id = "rtb-061390f159ede7f74"
    subnet_id      = "subnet-053c4c51efe00ff3c"
}

# aws_route_table_association.k8s_A:
resource "aws_route_table_association" "k8s_A" {
    id             = "rtbassoc-0d3f57d636e0d3eb0"
    route_table_id = "rtb-061390f159ede7f74"
    subnet_id      = "subnet-034243cd6c226d83c"
}

# aws_route_table_association.k8s_B:
resource "aws_route_table_association" "k8s_B" {
    id             = "rtbassoc-00e2a41d0e834d075"
    route_table_id = "rtb-061390f159ede7f74"
    subnet_id      = "subnet-0da053d5df13649f8"
}

# aws_subnet.research_subnet_bastion_A:
resource "aws_subnet" "research_subnet_bastion_A" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-0850e0b0e57e83ebc"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2a"
    availability_zone_id            = "usw2-az1"
    cidr_block                      = "10.0.12.0/24"
    id                              = "subnet-0850e0b0e57e83ebc"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = true
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-bastion-A"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-bastion-A"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_db_A:
resource "aws_subnet" "research_subnet_db_A" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-0588620f7f26736f0"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2a"
    availability_zone_id            = "usw2-az1"
    cidr_block                      = "10.0.48.0/20"
    id                              = "subnet-0588620f7f26736f0"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = false
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-db-A"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-db-A"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_db_B:
resource "aws_subnet" "research_subnet_db_B" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-053c4c51efe00ff3c"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2b"
    availability_zone_id            = "usw2-az2"
    cidr_block                      = "10.0.64.0/20"
    id                              = "subnet-053c4c51efe00ff3c"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = false
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-db-B"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-db-B"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_k8s_A:
resource "aws_subnet" "research_subnet_k8s_A" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-034243cd6c226d83c"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2a"
    availability_zone_id            = "usw2-az1"
    cidr_block                      = "10.0.20.0/22"
    id                              = "subnet-034243cd6c226d83c"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = false
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-k8s-A"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-k8s-A"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_k8s_B:
resource "aws_subnet" "research_subnet_k8s_B" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-0da053d5df13649f8"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2b"
    availability_zone_id            = "usw2-az2"
    cidr_block                      = "10.0.24.0/22"
    id                              = "subnet-0da053d5df13649f8"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = false
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-k8s-B"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-k8s-B"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_public_A:
resource "aws_subnet" "research_subnet_public_A" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-058616e37e52d79cd"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2a"
    availability_zone_id            = "usw2-az1"
    cidr_block                      = "10.0.0.0/22"
    id                              = "subnet-058616e37e52d79cd"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = true
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-public-A"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-public-A"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_subnet.research_subnet_public_B:
resource "aws_subnet" "research_subnet_public_B" {
    arn                             = "arn:aws:ec2:us-west-2:581092633589:subnet/subnet-0c1418856f4d94899"
    assign_ipv6_address_on_creation = false
    availability_zone               = "us-west-2b"
    availability_zone_id            = "usw2-az2"
    cidr_block                      = "10.0.4.0/22"
    id                              = "subnet-0c1418856f4d94899"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = true
    owner_id                        = "581092633589"
    tags                            = {
        "Environment" = "research"
        "Name"        = "research-subnet-public-B"
    }
    tags_all                        = {
        "Environment" = "research"
        "Name"        = "research-subnet-public-B"
    }
    vpc_id                          = "vpc-0efa23c55e0a044c4"
}

# aws_vpc.research_vpc:
resource "aws_vpc" "research_vpc" {
    arn                              = "arn:aws:ec2:us-west-2:581092633589:vpc/vpc-0efa23c55e0a044c4"
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "10.0.0.0/16"
    default_network_acl_id           = "acl-081ecee08d8a12827"
    default_route_table_id           = "rtb-061390f159ede7f74"
    default_security_group_id        = "sg-01d1d3691335b21e4"
    dhcp_options_id                  = "dopt-0b6419aaeaa4f9f20"
    enable_classiclink               = false
    enable_classiclink_dns_support   = false
    enable_dns_hostnames             = true
    enable_dns_support               = true
    id                               = "vpc-0efa23c55e0a044c4"
    instance_tenancy                 = "default"
    main_route_table_id              = "rtb-061390f159ede7f74"
    owner_id                         = "581092633589"
    tags                             = {
        "Environment" = "research"
        "Name"        = "theory-k8s-research"
    }
    tags_all                         = {
        "Environment" = "research"
        "Name"        = "theory-k8s-research"
    }
}

