locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service      = var.Service
    Owner        = var.Owner
    Environment  = var.Environment
    Tier         = var.Tier
    Build-Method = var.Build-Method
    CostCenter   = var.CostCenter
    Complaince   = var.Compliance

  }
}

# Get latest Amazon Linux 2 AMI for the web servers
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# Get latest Windows Server 2019 AMI
data "aws_ami" "windows-2019" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base*"]
  }
}

# Get latest SQL server AMI
data "aws_ami" "amznlnx2-SQL" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-x86_64-SQL_2017_Standard*"]
  }
}

data "aws_vpc" "customer_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.Owner}-${var.Environment}-VPC"]
  }
}

data "aws_vpc" "customer_private_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["${var.Owner}-${var.Environment}-Private-Subnet-1"]
  }
}

data "aws_vpc" "customer_private_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["${var.Owner}-${var.Environment}-Private-Subnet-2"]
  }
}

data "aws_vpc" "customer_public_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["${var.Owner}-${var.Environment}-Public-Subnet-1"]
  }
}

data "aws_vpc" "customer_public_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["${var.Owner}-${var.Environment}-Public-Subnet-2"]
  }
}