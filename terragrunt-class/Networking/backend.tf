terraform {
  backend "s3" {
    key            = "terraform/tfstate.tfstate"
    bucket         = "terragrunt-backened"
    region         = "us-east-1"
    profile        = "shilohIT"
    dynamodb_table = "Terraform"
  }
}