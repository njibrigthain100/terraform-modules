terraform {
  backend "s3" {
    key            = "terraform/tfstate.tfstate"
    bucket         = "bkmicroservices"
    region         = "us-east-1"
    profile        = "shilohIT"
    dynamodb_table = "Terraform"
  }
}