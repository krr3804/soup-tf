output "dynamodb_table_name_net" {
  value       = aws_dynamodb_table.terraform_locks[0].name
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_name_iam" {
  value       = aws_dynamodb_table.terraform_locks[1].name
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_name_c9net" {
  value       = aws_dynamodb_table.terraform_locks[2].name
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_name_cluster" {
  value       = aws_dynamodb_table.terraform_locks[3].name
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_name_nodeg" {
  value       = aws_dynamodb_table.terraform_locks[4].name
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_name_maint" {
  value       = aws_dynamodb_table.terraform_locks[5].name
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_name_lb" {
  value       = aws_dynamodb_table.terraform_locks[6].name
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_name_efs" {
  value       = aws_dynamodb_table.terraform_locks[7].name
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_name_tool-apps" {
  value       = aws_dynamodb_table.terraform_locks[8].name
  description = "The name of the DynamoDB table"
}

output "region" {
  value       = aws_s3_bucket.terraform_state[*].region
  description = "The name of the region"
}

output "s3_bucket" {
  value       = aws_s3_bucket.terraform_state[*].bucket
  description = "The ARN of the S3 bucket"
}