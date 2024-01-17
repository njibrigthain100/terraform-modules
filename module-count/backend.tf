terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "terraform-backened"
    region = "us-east-1"
    profile = "QA"
    dynamodb_table = "Terraform"
  }
}