variable "Environment" {
  type        = string
  description = "The environment to create the resources in"

}

variable "Service" {
  type        = string
  description = "The type of service provided to the client"

}

variable "Owner" {
  type        = string
  description = "The owner of all the resources to be built"


}

variable "Tier" {
  type        = string
  description = "The Tier for the resource created"

}

variable "Build-Method" {
  type        = string
  description = "The method used to create the resource"


}

variable "CostCenter" {
  type        = string
  description = "The cost center to be applied to the resources"


}

variable "Complaince" {
  type        = string
  description = "The compliance status of the resources"


}

variable "cidr_block" {
  type        = string
  description = "The vpc cidr block to be used"


}

variable "region_name" {
  type        = string
  description = "The region for resources creation"


}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "The cidr range for all the private subnets"


}

variable "public_subnets_cidr" {
  type        = list(string)
  description = "The cidr range for all the public subnets"


}

variable "private_az" {
  type        = list(string)
  description = "The availability zones on which to create the private sunets"

}

variable "public_az" {
  type        = list(string)
  description = "The availability zones on which to create the public sunets"

}

variable "instance-profile" {
  type        = string
  description = "The instance profile to be used during execution"

}