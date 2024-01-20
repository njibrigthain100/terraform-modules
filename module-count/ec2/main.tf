data "aws_vpc" "BKvpc" {
  filter{
    name = "tag:Name" 
    values = ["BK-SYSOPS-vpc101"]

  }
}

data "aws_subnet" "mypublicSN" {
    vpc_id = data.aws_vpc.BKvpc.id
  filter {
    name = "tag:Name" 
    values = ["PubSN1"]
  }
}

# variable "aws_profile" {
#   type = string 
#   description = "The aws profile to be used for the operation"

resource "aws_instance" "ec2" {
  ami = var.ami_id
  instance_type = var.instance_type 
  availability_zone = var.az
  associate_public_ip_address = "true"
  iam_instance_profile = var.instance-profile
  user_data = "${file("apache.sh")}"
  key_name = var.keyname
  subnet_id = data.aws_subnet.mypublicSN.id
  security_groups = var.SecurityGroup
  count = length(var.server_names)

  tags = {
    Name = element(var.server_names, count.index)
  }
}