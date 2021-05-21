## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_route_table.route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_eip.rt_nat_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.rt_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.rt_nat_gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.rt_nat_gw_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.DB_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.DB_B](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.k8s_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.k8s_B](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.rt_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.rt_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AWS_REGION"></a> [AWS\_REGION](#input\_AWS\_REGION) | n/a | `string` | `"us-west-2"` | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | n/a | `string` | `"10.0.0.0/16"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"research"` | no |
| <a name="input_rt_subnets"></a> [rt\_subnets](#input\_rt\_subnets) | n/a | `map(tuple([string,bool,string]))` | <pre>{<br>  "subnet-A": [<br>    "10.0.0.0/22",<br>    true,<br>    "us-west-2a"<br>  ],<br>  "subnet-B": [<br>    "10.0.4.0/22",<br>    true,<br>    "us-west-2b"<br>  ],<br>  "subnet-bastion-A": [<br>    "10.0.12.0/24",<br>    true,<br>    "us-west-2a"<br>  ],<br>  "subnet-db-A": [<br>    "10.0.48.0/20",<br>    false,<br>    "us-west-2a"<br>  ],<br>  "subnet-db-B": [<br>    "10.0.64.0/20",<br>    false,<br>    "us-west-2b"<br>  ],<br>  "subnet-k8-A": [<br>    "10.0.20.0/22",<br>    false,<br>    "us-west-2a"<br>  ],<br>  "subnet-k8-B": [<br>    "10.0.24.0/22",<br>    false,<br>    "us-west-2b"<br>  ]<br>}</pre> | no |
| <a name="input_rt_vpc"></a> [rt\_vpc](#input\_rt\_vpc) | n/a | <pre>object({<br>    name = string<br>    cidr_block = string<br>  })</pre> | <pre>{<br>  "cidr_block": "10.0.0.0/16",<br>  "name": "theory-k8s"<br>}</pre> | no |

## Outputs

No outputs.
