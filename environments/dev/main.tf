
module "vpc" {
  source    = "../../modules/vpc"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
}

module "security" {
  source      = "../../modules/security"
  vpc_id      = module.vpc.vpc_id
  subnet_id   = module.vpc.subnet_id
  instance_id = module.ec2.instance_id
}

module "ec2" {
  source            = "../../modules/ec2"
  security_group_id = module.security.security_group_id
  subnet_id         = module.vpc.subnet_id
  availability_zone = "us-east-2a"
  ami               = "ami-09ad6bca8b1dfb96b"
  instance_type     = "t2.micro"
}

module "s3_backend" {
  source      = "../../modules/s3"
  bucket_name = "sajjan-terraform-state"
dynamodb_table_name = "terraform-state-lock"
  tags = {
  Name = "sajjan_buckets" }
}

terraform {
  backend "s3" {
    bucket         = "sajjan-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}


