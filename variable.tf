#vpc
variable "cidr_block" {

  type = string
  # default = "10.0.0.0/16"
}

#public subnet
variable "public_cidr_block" {
  # default = "10.0.1.0/24"
  type = string
}

#private subnet
variable "private_cidr_block" {
  # default = "10.0.2.0/24"
  type = string
}

#tags
variable "publictags" {
  # default = "public tags"
  type = string

}


variable "privatetags" {
  # default = "private tags"
  type = string

}

variable "tags" {
  # default = "vpctags"
  type = string

}
#rouet Table
variable "route_cidrBlock" {
  # default = "0.0.0.0/0"
  type = string
}

#natgateway

variable "nat_gateway" {
  #  default     = "public"
  type = string
}

variable "map_public_ip_on_launch" {
  type = bool  // boolean type value
  # default = true
 }