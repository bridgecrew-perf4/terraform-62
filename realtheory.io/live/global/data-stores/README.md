$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
+ create

Terraform will perform the following actions:

# aws_dynamodb_table.terraform_locks will be created
+ resource "aws_dynamodb_table" "terraform_locks" {
    + arn              = (known after apply)
    + billing_mode     = "PAY_PER_REQUEST"
    + hash_key         = "LockId"
    + id               = (known after apply)
    + name             = "rt-terraform-locks"
    + stream_arn       = (known after apply)
    + stream_label     = (known after apply)
    + stream_view_type = (known after apply)
    + tags             = {
        + "Environment" = "global"
        + "Name"        = "rt-terraform-locks-global"
          }
    + tags_all         = {
        + "Environment" = "global"
        + "Name"        = "rt-terraform-locks-global"
          }

    + attribute {
        + name = "LockId"
        + type = "S"
          }

    + point_in_time_recovery {
        + enabled = (known after apply)
          }

    + server_side_encryption {
        + enabled     = (known after apply)
        + kms_key_arn = (known after apply)
          }
          }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
+ dynamodb_table_name = "rt-terraform-locks"

Do you want to perform these actions?
Terraform will perform the actions described above.
Only 'yes' will be accepted to approve.

Enter a value: yes

aws_dynamodb_table.terraform_locks: Creating...
aws_dynamodb_table.terraform_locks: Still creating... [10s elapsed]
aws_dynamodb_table.terraform_locks: Creation complete after 17s [id=rt-terraform-locks]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

dynamodb_table_name = "rt-terraform-locks"
$ 
