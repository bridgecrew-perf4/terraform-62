output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
  description = "Name of table that holds terraform state"
}