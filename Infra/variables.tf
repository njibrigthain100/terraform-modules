variable "vpcname" {
  type = string 
  description = "The name of the vpc to be created"
  default = "myvpc"
}

variable "vpccidr" {
  type = string 
  description = "The cidr range of the vpc to be used"
  default = "10.0.0.0/16"
}

variable "myregion" {
  type = string 
  description = "The region in which resources will be created in"
  default = "us-east-1"
}
