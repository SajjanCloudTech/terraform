variable "bucket_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for Terraform state locking"
  type        = string
}
