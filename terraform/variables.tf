variable "region" {
  description = "AWS region"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnets"
  type        = string
}

variable "public_ip_cidr" {
  description = "Public IP CIDR for SSH access"
  type        = string
}

variable "public_ami" {
  description = "AMI for public instance"
  type        = string
}

variable "private_ami" {
  description = "AMI for private instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "iam_role_arn" {
  description = "IAM Role ARN for VPC Flow Logs"
  type        = string
}

