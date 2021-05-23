terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
+ create

Terraform will perform the following actions:

# aws_s3_bucket.terraform_state will be created
+ resource "aws_s3_bucket" "terraform_state" {
    + acceleration_status         = (known after apply)
    + acl                         = "private"
    + arn                         = (known after apply)
    + bucket                      = "realtheory-v1-terraform-state"
    + bucket_domain_name          = (known after apply)
    + bucket_regional_domain_name = (known after apply)
    + force_destroy               = false
    + hosted_zone_id              = (known after apply)
    + id                          = (known after apply)
    + region                      = (known after apply)
    + request_payer               = (known after apply)
    + tags                        = {
        + "Environment" = "global"
        + "Name"        = "realtheory-v1-terraform-state-global"
          }
    + tags_all                    = {
        + "Environment" = "global"
        + "Name"        = "realtheory-v1-terraform-state-global"
          }
    + website_domain              = (known after apply)
    + website_endpoint            = (known after apply)

    + server_side_encryption_configuration {
        + rule {
            + apply_server_side_encryption_by_default {
                + sse_algorithm = "AES256"
                  }
                  }
                  }

    + versioning {
        + enabled    = true
        + mfa_delete = false
          }
          }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
+ s3_bucket_arn = (known after apply)

Do you want to perform these actions?
Terraform will perform the actions described above.
Only 'yes' will be accepted to approve.

Enter a value: yes

aws_s3_bucket.terraform_state: Creating...
aws_s3_bucket.terraform_state: Creation complete after 6s [id=realtheory-v1-terraform-state]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

s3_bucket_arn = "arn:aws:s3:::realtheory-v1-terraform-state"
