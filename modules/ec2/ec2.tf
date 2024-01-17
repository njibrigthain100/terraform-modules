variable "ec2name" {
  type = string
  description = "The name assigned to the instance"
  default = "TerraformInstance"
}

variable "instance-type" {
    type = string 
    description = "The instance type used for the instance"
    default = "t2.micro"
  
}

variable "instance-ami" {
  type = string 
  description = "The ami to be used for the creation of the instance"
  default = "ami-09269b3bba68e4a13"
}
resource "aws_instance" "terraform-ec2" {
    ami = var.instance-ami
    instance_type = var.instance-type

    tags = {
      Name = var.ec2name
    }
}

output "instance_id" {
  value = aws_instance.terraform-ec2.id
}