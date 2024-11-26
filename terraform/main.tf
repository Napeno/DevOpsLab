provider "aws" {
  region = var.region
}

module "vpc" {
  source               = "./vpc"
  region               = var.region
  cidr_block           = var.cidr_block
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  availability_zone    = var.availability_zone
  iam_role_arn         = var.iam_role_arn
}

module "nat_gateway" {
  source                 = "./nat_gateway"
  region                 = var.region
  public_subnet_id       = module.vpc.public_subnet_id
  private_route_table_id = module.vpc.private_route_table_id
}

module "ec2" {
  source              = "./ec2"
  region              = var.region
  vpc_id              = module.vpc.vpc_id
  public_subnet_id    = module.vpc.public_subnet_id
  private_subnet_id   = module.vpc.private_subnet_id
  public_ip_cidr      = var.public_ip_cidr
  public_ami          = var.public_ami
  private_ami         = var.private_ami
  instance_type       = var.instance_type
  default_security_group_id = module.vpc.default_security_group_id
}

