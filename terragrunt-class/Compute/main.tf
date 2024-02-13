module "security-group-module" {
    source = "./ec2/Security_group"
    region_name = var.region_name
    instance-profile = var.instance-profile
    Environment = var.Environment
    Service = var.Service
    Owner = var.Owner
    Tier = var.Tier
    Build-Method = var.Build-Method
    CostCenter = var.CostCenter
    Compliance = var.Compliance
    webserver-security_group_rules = var.webserver-security_group_rules
    ssh-bastion-security_group_rules = var.ssh-bastion-security_group_rules
    rdp-bastion-security_group_rules = var.rdp-bastion-security_group_rules
    appserver-security_group_rules = var.appserver-security_group_rules
}