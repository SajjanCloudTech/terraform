
variable "vpc_id" {
  description = "The ID of the VPC to associate with the security resources"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the security resources"
  type        = string
}

variable "environment" {
  default = "default"
}