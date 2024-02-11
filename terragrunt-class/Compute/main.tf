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
}