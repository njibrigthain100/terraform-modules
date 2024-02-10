locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service      = var.Service
    Owner        = var.Owner
    Environment  = var.Environment
    Tier         = var.Tier
    Build-Method = var.Build-Method
    CostCenter   = var.CostCenter
    Complaince   = var.Complaince

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