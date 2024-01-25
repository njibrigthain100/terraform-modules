variable "Environment" {
  type = string 
  description = "The environment to create the resources in"
  default = "prod"
}

variable "Service" {
  type = string
  description = "The type of service provided to the client"
  default = "Network"
}

variable "Owner" {
   type = string
   description = "The owner of all the resources to be built"
   default = "Customer-Application-a"
  
}

variable "Tier" {
  type = string 
  description = "The Tier for the resource created" 
  default = "1"
}

variable "Build-Method" {
  type = string
  description = "The method used to create the resource" 
  default = "Greenfield"
  
}

variable "CostCenter" {
  type = string 
  description = "The cost center to be applied to the resources"
  default = "1.0.0.1"
  
}

variable "Complaince" {
    type = string
    description = "The compliance status of the resources"
    default = "HIPAA"
  
}

variable "cidr_block" {
    type = string
    description = "The vpc cidr block to be used"
    default = "10.2.0.0/16"
  
}

variable "region_name" {
    type = string
    description = "The region for resources creation"
    default = "us-east-1"
  
}