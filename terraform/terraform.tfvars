region               = "us-east-1"
cidr_block           = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet_cidr  = "10.0.2.0/24"
availability_zone    = "us-east-1a"
public_ip_cidr       = "0.0.0.0/0"
public_ami           = "ami-0c02fb55956c7d316"  
private_ami          = "ami-0c02fb55956c7d316" 
instance_type        = "t2.micro"
iam_role_arn = "arn:aws:iam::123456789012:role/vpc-flow-logs-role"
