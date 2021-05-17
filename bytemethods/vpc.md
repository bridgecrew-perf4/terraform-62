# VPC Configuration

## Init

```bash
> terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v3.40.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
(Sun May-5 4:41:22pm)-(CPU 19.6%:0:Net 27)-(hugomatus:~/sandbox/terraform/bytemethods)-(28K:5)
```

## Plan

```bash
(Sun May-5 4:41:22pm)-(CPU 19.6%:0:Net 27)-(hugomatus:~/sandbox/terraform/bytemethods)-(28K:5)
> terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.research-vpc will be created
  + resource "aws_vpc" "research-vpc" {
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

Plan: 1 to add, 0 to change, 0 to destroy.
```

## Apply

```bash
(Sun May-5 4:47:10pm)-(CPU 19.2%:0:Net 20)-(hugomatus:~/sandbox/terraform/bytemethods)-(28K:5)
> terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.research-vpc will be created
  + resource "aws_vpc" "research-vpc" {
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

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_vpc.research-vpc: Creating...
aws_vpc.research-vpc: Still creating... [10s elapsed]
aws_vpc.research-vpc: Creation complete after 12s [id=vpc-0ce5506ab660f0cab]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

### Output

```bash
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_vpc.research-vpc: Creating...
aws_vpc.research-vpc: Still creating... [10s elapsed]
aws_vpc.research-vpc: Creation complete after 12s [id=vpc-0ce5506ab660f0cab]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
(Sun May-5 4:48:25pm)-(CPU 19.1%:0:Net 29)-(hugomatus:~/sandbox/terraform/bytemethods)-(32K:6)

```

## Show

```text
> terraform show
# aws_vpc.research-vpc:
resource "aws_vpc" "research-vpc" {
    arn                              = "arn:aws:ec2:us-west-2:581092633589:vpc/vpc-0ce5506ab660f0cab"
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "10.0.0.0/16"
    default_network_acl_id           = "acl-0e39b7fb1b393a90f"
    default_route_table_id           = "rtb-0c71df2372e81b507"
    default_security_group_id        = "sg-030b652dbecfcdedf"
    dhcp_options_id                  = "dopt-0b6419aaeaa4f9f20"
    enable_classiclink               = false
    enable_classiclink_dns_support   = false
    enable_dns_hostnames             = true
    enable_dns_support               = true
    id                               = "vpc-0ce5506ab660f0cab"
    instance_tenancy                 = "default"
    main_route_table_id              = "rtb-0c71df2372e81b507"
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
```
