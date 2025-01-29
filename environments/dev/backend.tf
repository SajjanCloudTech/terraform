terraform {
  backend "s3" {
    bucket         = "sajjan-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
