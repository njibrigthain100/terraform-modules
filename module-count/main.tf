module "ec2countmodule" {
  source = "./ec2"
  ami_id = "ami-0c0b74d29acd0cd97"
  instance_type = "t2.micro"
  myregion = "us-east-1"
  environment = "prod"
  az = "us-east-1a"
  instance-profile = "AdminFullAccess"
  keyname = "qa-keypair"
    # mypubsubnet = "subnet-def3aad0"
  SecurityGroup = [ "sg-0f6f082de3e8489c1", "sg-012757dc8bd4c1fd4" ]
  server_names = [ "bk-tech-app", "bk-tech-web", "bk-tech-db" ]
}

output "instance_id" {
  value = module.ec2countmodule.MyInstnaceIDs
}