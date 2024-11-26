variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where EC2 instances will be deployed"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "public_ip_cidr" {
  description = "Public IP CIDR for EC2 instances"
  type        = string
}

variable "public_ami" {
  description = "AMI ID for public instance"
  type        = string
}

variable "private_ami" {
  description = "AMI ID for private instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "default_security_group_id" {
  description = "ID of the default security group from VPC"
  type        = string
}
