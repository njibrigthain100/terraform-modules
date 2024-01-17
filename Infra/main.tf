provider "aws" {
  region  = var.myregion
}

resource "aws_vpc" "Terraform-vpc" {
  cidr_block = var.vpccidr

  tags = {
    Name = var.vpcname
  }
}

