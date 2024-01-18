provider "aws" {
  region  = "us-east-1"
}

variable "VPC-prefix" {
  type = string 
  description = "Prefix for vpc"
  default = "BK"
}

variable "VPC-Suffix" {
    type = string 
    description = "VPC Suffix"
    default = "SYSOPS-vpc101"
  
}

data "aws_vpc" "Test" {
    filter {
      name = "tag:Name"
    values = ["${var.VPC-prefix}-${var.VPC-Suffix}"]
    }
}

output "test" {
  value = data.aws_vpc.Test.id
}