variable "security_group_id" {
  description = "The ID of the security group to attach to the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the EC2 instance in"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to launch the EC2 instance in"
  type        = string
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "ec2_count" {
  type = number
}

variable "environment" {
  default = "default"
}
