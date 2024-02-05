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


variable "security_group_rules" {
  description = "All security group rules"
  type = list(object({
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
    description = string
  }))
  default = [{
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr_ipv4   = "0.0.0.0/0"
    description = "SSH"
    },
    {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
      description = "HTTP"
    },
    {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
      description = "HTTPS"
  }]

}