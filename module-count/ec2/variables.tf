variable "ami_id" {
  type = string 
  description = "The ami to be used to create the instance"

}

variable "instance_type" {
  type = string 
  description = "The instance type to be used"

}

variable "myregion" {
  type = string 
  description = "The region to be used for this"

}

variable "environment" {
    type = string 
    description = "The environment in which to create the instances"

  
}

variable "az" {
  type = string 
  description = "The availability zone for where to launch the instance"

}

variable "instance-profile" {
  type = string 
  description = "The instance profile to be used for the instance"
}

variable "keyname" {
  type = string 
  description = "The name of the key pair to use"
}

# variable "mypubsubnet" {
#   type = string 
#   description = "The subnet to create the instance in"
# }

variable "SecurityGroup" {
  type = list(string)
  description = "The security groups to be used for the instance"
}

variable "server_names" {
  type = list(string)
  description = "The name of all the ec2 instances to be created"
}