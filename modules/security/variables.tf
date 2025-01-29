variable "vpc_id" {
  description = "The ID of the VPC to associate with the security resources"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the security resources"
  type        = string
}
variable "instance_id" {
  description = "The instance type for the EC2 instance"
  type        = string
}


