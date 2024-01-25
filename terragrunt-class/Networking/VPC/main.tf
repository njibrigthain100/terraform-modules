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

resource "aws_subnet" "customer-private-subnets" {
    vpc_id = aws_vpc.customer-vpc.id
    availability_zone = var.private_az[count.index]
    count = length(var.private_subnets_cidr)
    cidr_block = var.private_subnets_cidr[count.index]

      tags = merge(local.common_tags,
    {
        "Name" = "${var.Owner}-${var.Environment}-Private-Subnet-${count.index + 1}"
    }
    )

}

resource "aws_subnet" "customer-public-subnets" {
    vpc_id = aws_vpc.customer-vpc.id
    availability_zone = var.public_az[count.index]
    count = length(var.public_subnets_cidr)
    # For the cidr block or az you can also use the element function as shown below
    # cidr_block = element(var.public_subnets_cidr, count.index)
    cidr_block = var.public_subnets_cidr[count.index]
    map_public_ip_on_launch = true 

      tags = merge(local.common_tags,
    {
        "Name" = "${var.Owner}-${var.Environment}-Public-Subnet-${count.index + 1}"
    }
    )

}
