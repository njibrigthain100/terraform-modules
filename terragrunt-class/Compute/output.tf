output "customer-webserver-security-group-id" {
  value = [module.security-group-module.customer-webserver-security-group]
}

output "customer-appserver-security-group-id" {
  value = [module.security-group-module.customer-appserver-security-group]
}

output "customer-shh-bastion-security-group-id" {
  value = [module.security-group-module.customer-ssh-security-group]
}

output "customer-RDP-bastion-security-group-id" {
  value = [module.security-group-module.customer-rdp-security-group]
}

