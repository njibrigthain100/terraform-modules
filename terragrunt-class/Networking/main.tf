module "vpc-module" {
  source               = "./VPC"
  Environment          = var.Environment
  Service              = var.Service
  Owner                = var.Owner
  Tier                 = var.Tier
  Build-Method         = var.Build-Method
  CostCenter           = var.CostCenter
  Complaince           = var.Complaince
  cidr_block           = var.cidr_block
  region_name          = var.region_name
  private_subnets_cidr = var.private_subnets_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_az           = var.private_az
  public_az            = var.public_az
}