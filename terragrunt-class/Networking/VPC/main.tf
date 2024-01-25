locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service = var.Service
    Owner   = var.Owner
    Environment = var.Environment
    Tier = var.Tier
    Build-Method = var.Build-Method 
    CostCenter = var.CostCenter
    Complaince = var.Complaince
    
  }
}

resource "aws_vpc" "customer-vpc" {
    cidr_block = var.cidr_block
    enable_dns_hostnames = true 

    tags = merge(local.common_tags,
    {
        "Name" = "${var.Owner}-${var.Environment}-VPC"
    }
    )
  
}
