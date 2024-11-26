variable "region" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}

variable "availability_zone" {
  description = "Availability zone for the subnets"
  type        = string
}

variable "iam_role_arn" {
  description = "IAM Role ARN for VPC Flow Logs"
  type        = string
}
