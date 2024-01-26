output "vpc-id" {
  value = [module.vpc-module.customer-vpc-id]
}

output "private-subnets-id" {
  value = [module.vpc-module.customer-private-subnets-id]
}

output "public-subnets-id" {
  value = [module.vpc-module.customer-public-subnets-id]
}

output "nat-gw-id" {
  value = [module.vpc-module.customer-nat-gw-id]
}

output "igw-id" {
  value = [module.vpc-module.customer-igw-id]
}