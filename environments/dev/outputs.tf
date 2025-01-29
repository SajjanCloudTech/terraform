output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "security_group_id" {
  value = module.security.security_group_id
}

output "s3_backend_bucket" {
  value = module.s3_backend.s3_bucket_name
}

output "dynamodb_backend_table" {
  value = module.s3_backend.dynamodb_table_name
}

