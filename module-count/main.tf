module "ec2countmodule" {
  source = "./ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type 
  az = var.az
  instance-profile = var.instance-profile
  keyname = var.keyname
  SecurityGroup = var.SecurityGroup
  count = length(var.server_names)
  environment = var.environment
  # aws_profile = var.aws_profile
  server_names = var.server_names
  myregion = var.myregion

}

