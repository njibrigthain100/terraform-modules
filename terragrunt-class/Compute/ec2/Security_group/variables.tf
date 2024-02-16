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

variable "Compliance" {
  type        = string
  description = "The compliance status of the resources"


}


variable "webserver-security_group_rules" {
  description = "All web server security group rules"
  type = list(object({
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
    description = string
  }))
#   default = [{
#     from_port   = 22
#     to_port     = 22
#     ip_protocol = "tcp"
#     cidr_ipv4   = "10.2.254.0/24"
#     description = "SSH"
#     },
#     {
#       from_port   = 80
#       to_port     = 80
#       ip_protocol = "tcp"
#       cidr_ipv4   = "10.2.254.0/24"
#       description = "HTTP"
#     },
#     {
#       from_port   = 443
#       to_port     = 443
#       ip_protocol = "tcp"
#       cidr_ipv4   = "10.2.254.0/24"
#       description = "HTTPS"
#     },
#     {
#     from_port   = 22
#     to_port     = 22
#     ip_protocol = "tcp"
#     cidr_ipv4   = "10.2.255.0/24"
#     description = "SSH"
#     },
#     {
#       from_port   = 80
#       to_port     = 80
#       ip_protocol = "tcp"
#       cidr_ipv4   = "10.2.255.0/24"
#       description = "HTTP"
#     },
#     {
#       from_port   = 443
#       to_port     = 443
#       ip_protocol = "tcp"
#       cidr_ipv4   = "10.2.255.0/24"
#       description = "HTTPS"
#   }]

 }

variable "ssh-bastion-security_group_rules" {
  description = "All ssh bastion security group rules"
  type = list(object({
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
    description = string
  }))
  # default = [{
  #   from_port   = 22
  #   to_port     = 22
  #   ip_protocol = "tcp"
  #   cidr_ipv4   = "0.0.0.0/0"
  #   description = "SSH"
  #   }]

}
variable "rdp-bastion-security_group_rules" {
  description = "All ssh bastion security group rules"
  type = list(object({
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
    description = string
  }))
  # default = [{
  #   from_port   = 3389
  #   to_port     = 3389
  #   ip_protocol = "tcp"
  #   cidr_ipv4   = "0.0.0.0/0"
  #   description = "RDP"
  #   }]

}

variable "appserver-security_group_rules" {
  description = "All app server security group rules"
  type = list(object({
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
    description = string
  }))
  # default = [{
  #   from_port   = 22
  #   to_port     = 22
  #   ip_protocol = "tcp"
  #   cidr_ipv4   = "10.2.254.0/24"
  #   description = "SSH from public subnet 1"
  #   },
  #   {
  #   from_port   = 22
  #   to_port     = 22
  #   ip_protocol = "tcp"
  #   cidr_ipv4   = "10.2.255.0/24"
  #   description = "SSH from public subnet 2"
  #   },
  #   {
  #   from_port   = 3389
  #   to_port     = 3389
  #   ip_protocol = "tcp"
  #   cidr_ipv4   = "10.2.254.0/24"
  #   description = "RDP from public subnet 1"
  #   },
  #       {
  #   from_port   = 3389
  #   to_port     = 3389
  #   ip_protocol = "tcp"
  #   cidr_ipv4   = "10.2.255.0/24"
  #   description = "RDP from public subnet 2"
  #   },
  #   {
  #     from_port   = 80
  #     to_port     = 80
  #     ip_protocol = "tcp"
  #     cidr_ipv4   = "10.2.254.0/24"
  #     description = "HTTP"
  #   },
  #    {
  #     from_port   = 80
  #     to_port     = 80
  #     ip_protocol = "tcp"
  #     cidr_ipv4   = "10.2.255.0/24"
  #     description = "HTTP"
  #   },
  #   {
  #     from_port   = 443
  #     to_port     = 443
  #     ip_protocol = "tcp"
  #     cidr_ipv4   = "10.2.254.0/24"
  #     description = "HTTPS"
  # },
  #   {
  #     from_port   = 443
  #     to_port     = 443
  #     ip_protocol = "tcp"
  #     cidr_ipv4   = "10.2.255.0/24"
  #     description = "HTTPS"
  # }]

}

variable "db-security_group_rules" {
  description = "All db server security group rules"
  type = list(object({
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
    description = string
  }))
}

variable "lb-security_group_rules" {
   description = "All lb security group rules"
  type = list(object({
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
    description = string
  }))
}
