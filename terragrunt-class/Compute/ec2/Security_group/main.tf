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
#####################Dynamically getting the vpc id from the console###############

data "aws_vpc" "customer_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.Owner}-${var.Environment}-VPC"]
  }
}

######################Creating the security groups for the cluster##################
resource "aws_security_group" "customer-security-group" {
  name = "${var.Owner}-${var.Environment}"
  vpc_id = data.aws_vpc.customer_vpc.id
  depends_on = [
  data.aws_vpc.customer_vpc]
  tags = merge(local.common_tags,
    {
      "Name" = "${var.Owner}-${var.Environment}-security_group"
    }
  )
}

#######################Creating the security group rules ingress rules#############################
resource "aws_vpc_security_group_ingress_rule" "customer-inbound-security-group-ingress-rules" {
  security_group_id = aws_security_group.customer-security-group.id
  count             = length(var.security_group_rules)
  ip_protocol       = var.security_group_rules[count.index].ip_protocol
  from_port         = var.security_group_rules[count.index].from_port
  to_port           = var.security_group_rules[count.index].to_port
  cidr_ipv4         = var.security_group_rules[count.index].cidr_ipv4
}

#########################Creating security group egress rules#######################
resource "aws_vpc_security_group_egress_rule" "customer-outbound-security-group-egress-rule" {
  security_group_id = aws_security_group.customer-security-group.id
  ip_protocol       = "-1"
  from_port         = 0
  to_port           = 0
  cidr_ipv4         = "0.0.0.0/0"
}