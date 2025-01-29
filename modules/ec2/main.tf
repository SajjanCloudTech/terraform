# Creating EC2 Instance
resource "aws_instance" "sajjan_web_server" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  subnet_id = var.subnet_id
  key_name          = "SajjanKeyPair"
security_groups = [var.security_group_id]
count = var.ec2_count


  tags = {
    Name = "Sajjan_Webserver-${terraform.workspace}"
    Environment = terraform.workspace
  }

lifecycle {
  ignore_changes = [ 
    security_groups,
    
   ]
}
}

