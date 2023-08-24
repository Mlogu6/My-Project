variable "env" {
  type = string
}

variable "product" {
  type = string
}

################################################################################
# VPC
################################################################################

variable "availability_zones" {
  type = list(any)
}
variable "vpc_cidr" {
  type = string
}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}

################################################################################
# ec2
################################################################################

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}
