variable "environment" {
  default = "default"
}

variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "instance_type" {
  description = "The instance type for EC2"
  type        = string
}
