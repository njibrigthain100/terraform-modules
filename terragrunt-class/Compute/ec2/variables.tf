variable "region_name" {
  type        = string
  description = "The region to deploy all the resources"
}

variable "instance-profile" {
  type        = string
  description = "The instance profile to use for resource deployment"

}

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