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
#####################Dynamically getting the vpc id from the console###############

data "aws_vpc" "customer_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.Owner}-${var.Environment}-VPC"]
  }
}

######################Creating the security groups for the cluster##################
resource "aws_security_group" "customer-webserver-security-group" {
  name = "${var.Owner}-${var.Environment}-Webserver"
  vpc_id = data.aws_vpc.customer_vpc.id
  depends_on = [
  data.aws_vpc.customer_vpc]
  tags = merge(local.common_tags,
    {
      "Name" = "${var.Owner}-${var.Environment}-WebServer-security_group"
    }
  )
}

#######################Creating the security group rules ingress rules#############################
resource "aws_vpc_security_group_ingress_rule" "customer-inbound-webserver-security-group-ingress-rules" {
  security_group_id = aws_security_group.customer-webserver-security-group.id
  count             = length(var.webserver-security_group_rules)
  ip_protocol       = var.webserver-security_group_rules[count.index].ip_protocol
  from_port         = var.webserver-security_group_rules[count.index].from_port
  to_port           = var.webserver-security_group_rules[count.index].to_port
  cidr_ipv4         = var.webserver-security_group_rules[count.index].cidr_ipv4
}

#########################Creating security group egress rules#######################
resource "aws_vpc_security_group_egress_rule" "customer-outbound-webserver-security-group-egress-rule" {
  security_group_id = aws_security_group.customer-webserver-security-group.id
  ip_protocol       = "-1"
  from_port         = 0
  to_port           = 0
  cidr_ipv4         = "0.0.0.0/0"
}

###########################Creating SSH Bastion security group############################
resource "aws_security_group" "customer-SSH-Bastion-sg" {
  name = "${var.Owner}-${var.Environment}-SSH-Bastion"
  vpc_id = data.aws_vpc.customer_vpc.id
  depends_on = [
  data.aws_vpc.customer_vpc]
  tags = merge(local.common_tags,
    {
      "Name" = "${var.Owner}-${var.Environment}-SSH-Bastion-Security-group"
    }
  )
}

#######################Creating the ssh bastion security group rules ingress rules#############################
resource "aws_vpc_security_group_ingress_rule" "customer-inbound-ssh-bastionsecurity-group-ingress-rules" {
  security_group_id = aws_security_group.customer-SSH-Bastion-sg.id
  count             = length(var.ssh-bastion-security_group_rules)
  ip_protocol       = var.ssh-bastion-security_group_rules[count.index].ip_protocol
  from_port         = var.ssh-bastion-security_group_rules[count.index].from_port
  to_port           = var.ssh-bastion-security_group_rules[count.index].to_port
  cidr_ipv4         = var.ssh-bastion-security_group_rules[count.index].cidr_ipv4
}
###########################Creating RDP Bastion security group############################
resource "aws_security_group" "customer-RDP-Bastion-sg" {
  name = "${var.Owner}-${var.Environment}-RDP-Bastion"
  vpc_id = data.aws_vpc.customer_vpc.id
  depends_on = [
  data.aws_vpc.customer_vpc]
  tags = merge(local.common_tags,
    {
      "Name" = "${var.Owner}-${var.Environment}-RDP-Bastion-Security-group"
    }
  )
}

#######################Creating the RDP bastion security group rules ingress rules#############################
resource "aws_vpc_security_group_ingress_rule" "customer-inbound-rdp-bastion-security-group-ingress-rules" {
  security_group_id = aws_security_group.customer-RDP-Bastion-sg.id
  count             = length(var.ssh-bastion-security_group_rules)
  ip_protocol       = var.rdp-bastion-security_group_rules[count.index].ip_protocol
  from_port         = var.rdp-bastion-security_group_rules[count.index].from_port
  to_port           = var.rdp-bastion-security_group_rules[count.index].to_port
  cidr_ipv4         = var.rdp-bastion-security_group_rules[count.index].cidr_ipv4
}
###########################Creating App server security group############################
resource "aws_security_group" "customer-appserver-security-group" {
  name = "${var.Owner}-${var.Environment}-Appserver"
  vpc_id = data.aws_vpc.customer_vpc.id
  depends_on = [
  data.aws_vpc.customer_vpc]
  tags = merge(local.common_tags,
    {
      "Name" = "${var.Owner}-${var.Environment}-Appserver-security-group"
    }
  )
}

#######################Creating the App server security group rules ingress rules#############################
resource "aws_vpc_security_group_ingress_rule" "customer-inbound-appserver-security-group-ingress-rules" {
  security_group_id = aws_security_group.customer-appserver-security-group.id
  count             = length(var.appserver-security_group_rules)
  ip_protocol       = var.appserver-security_group_rules[count.index].ip_protocol
  from_port         = var.appserver-security_group_rules[count.index].from_port
  to_port           = var.appserver-security_group_rules[count.index].to_port
  cidr_ipv4         = var.appserver-security_group_rules[count.index].cidr_ipv4
}

###########################Creating DB server security group############################
resource "aws_security_group" "customer-db-security-group" {
  name = "${var.Owner}-${var.Environment}-dbserver"
  vpc_id = data.aws_vpc.customer_vpc.id
  depends_on = [
  data.aws_vpc.customer_vpc]
  tags = merge(local.common_tags,
    {
      "Name" = "${var.Owner}-${var.Environment}-db-security-group"
    }
  )
}

#######################Creating the App server security group rules ingress rules#############################
resource "aws_vpc_security_group_ingress_rule" "customer-inbound-dbserver-security-group-ingress-rules" {
  security_group_id = aws_security_group.customer-db-security-group.id
  count             = length(var.db-security_group_rules)
  ip_protocol       = var.db-security_group_rules[count.index].ip_protocol
  from_port         = var.db-security_group_rules[count.index].from_port
  to_port           = var.db-security_group_rules[count.index].to_port
  cidr_ipv4         = var.db-security_group_rules[count.index].cidr_ipv4
}

###########################Creating lb security group############################
resource "aws_security_group" "customer-lb-security-group" {
  name = "${var.Owner}-${var.Environment}-lb-security"
  vpc_id = data.aws_vpc.customer_vpc.id
  depends_on = [
  data.aws_vpc.customer_vpc]
  tags = merge(local.common_tags,
    {
      "Name" = "${var.Owner}-${var.Environment}-lb-security-group"
    }
  )
}

#######################Creating the App server security group rules ingress rules#############################
resource "aws_vpc_security_group_ingress_rule" "customer-inbound-lbserver-security-group-ingress-rules" {
  security_group_id = aws_security_group.customer-lb-security-group.id
  count             = length(var.lb-security_group_rules)
  ip_protocol       = var.lb-security_group_rules[count.index].ip_protocol
  from_port         = var.lb-security_group_rules[count.index].from_port
  to_port           = var.lb-security_group_rules[count.index].to_port
  cidr_ipv4         = var.lb-security_group_rules[count.index].cidr_ipv4
}
