variable "region_name" {
  type = string 
  description = "The region to deploy all the resources"
}

variable "instance-profile" {
    type = string 
    description = "The instance profile to use for resource deployment"
  
}