
Plan: 17 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
Terraform will perform the actions described above.
Only 'yes' will be accepted to approve.

Enter a value: yes

module.vpc.aws_vpc.rt_vpc: Creating...
module.vpc.aws_vpc.rt_vpc: Still creating... [10s elapsed]
module.vpc.aws_vpc.rt_vpc: Creation complete after 15s [id=vpc-0888d81bdb474565c]
module.vpc.aws_internet_gateway.rt_igw: Creating...
module.vpc.aws_subnet.rt_subnet_public_B: Creating...
module.vpc.aws_subnet.rt_subnet_db_A: Creating...
module.vpc.aws_subnet.rt_subnet_db_B: Creating...
module.vpc.aws_subnet.rt_subnet_k8s_B: Creating...
module.vpc.aws_subnet.rt_subnet_k8s_A: Creating...
module.vpc.aws_subnet.rt_subnet_public_A: Creating...
module.vpc.aws_subnet.rt_subnet_bastion_A: Creating...
module.vpc.aws_subnet.rt_subnet_db_A: Creation complete after 2s [id=subnet-01629ac43b363c877]
module.vpc.aws_subnet.rt_subnet_db_B: Creation complete after 2s [id=subnet-0c5e86db80fd14262]
module.vpc.aws_subnet.rt_subnet_k8s_A: Creation complete after 2s [id=subnet-0be6b249fcd2dc5d4]
module.vpc.aws_subnet.rt_subnet_k8s_B: Creation complete after 2s [id=subnet-0b8eb9407892b0bfe]
module.vpc.aws_internet_gateway.rt_igw: Creation complete after 3s [id=igw-0622dfd111a6da0f3]
module.vpc.aws_default_route_table.route_table: Creating...
module.vpc.aws_default_route_table.route_table: Creation complete after 2s [id=rtb-0daf98a453c88b09e]
module.vpc.aws_route_table_association.DB_B: Creating...
module.vpc.aws_route_table_association.k8s_B: Creating...
module.vpc.aws_route_table_association.k8s_A: Creating...
module.vpc.aws_route_table_association.DB_A: Creating...
module.vpc.aws_route_table_association.DB_A: Creation complete after 1s [id=rtbassoc-0cfbdd9779be5e8c5]
module.vpc.aws_route_table_association.k8s_A: Creation complete after 1s [id=rtbassoc-04ce54952e4e81961]
module.vpc.aws_eip.rt_nat_eip: Creating...
module.vpc.aws_route_table_association.DB_B: Creation complete after 1s [id=rtbassoc-0abde5bba584f1354]
module.vpc.aws_route_table_association.k8s_B: Creation complete after 1s [id=rtbassoc-0ea657b4721bebae4]
module.vpc.aws_eip.rt_nat_eip: Creation complete after 1s [id=eipalloc-0414a03b2b821d749]
module.vpc.aws_nat_gateway.rt_nat_gw: Creating...
module.vpc.aws_subnet.rt_subnet_public_B: Still creating... [10s elapsed]
module.vpc.aws_subnet.rt_subnet_public_A: Still creating... [10s elapsed]
module.vpc.aws_subnet.rt_subnet_bastion_A: Still creating... [10s elapsed]
module.vpc.aws_subnet.rt_subnet_bastion_A: Creation complete after 13s [id=subnet-068bfcc2a219643d2]
module.vpc.aws_subnet.rt_subnet_public_B: Creation complete after 13s [id=subnet-067a46d38a0fd5ecf]
module.vpc.aws_subnet.rt_subnet_public_A: Creation complete after 13s [id=subnet-0c58eff2680120b28]
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
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [1m50s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Still creating... [2m0s elapsed]
module.vpc.aws_nat_gateway.rt_nat_gw: Creation complete after 2m0s [id=nat-0df9a590c3a278b20]
module.vpc.aws_route_table.rt_nat_gw_rt: Creating...
module.vpc.aws_route_table.rt_nat_gw_rt: Creation complete after 2s [id=rtb-0d304321e2acb5449]

Apply complete! Resources: 17 added, 0 changed, 0 destroyed.