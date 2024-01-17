module "ec2module" {
  source = "./ec2"
#   instance-ami = "ami From Module"
#   instance-type = "instance_type From Module"
#   ec2name = "Name From Module"
  
  
}

output "module_ec2_output" {
  value = module.ec2module.instance_id
}