resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Private Route Table"
  }
}

# Tạo Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Internet Gateway"
  }
}

# Tạo bảng định tuyến public
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Public Route Table"
  }
}

# Thêm route từ bảng định tuyến public đến Internet Gateway
resource "aws_route" "public_to_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Gắn public subnet vào bảng định tuyến public
resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_flow_log" "vpc_flow_logs" {
  log_group_name         = "/aws/vpc/flow-logs"
  iam_role_arn           = "arn:aws:iam::970547379849:role/cloudwatch"
  vpc_id                 = aws_vpc.main.id
  traffic_type           = "ALL"
  log_destination_type   = "cloud-watch-logs"
}

resource "aws_security_group" "default" {
  vpc_id                 = aws_vpc.main.id
  revoke_rules_on_delete = true
  description            = "Default security group for VPC"
}


resource "aws_security_group_rule" "deny_all_inbound" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.0.0/16"]
  description       = "Deny all inbound traffic"
  security_group_id = aws_security_group.default.id
  lifecycle {
    ignore_changes = [protocol, from_port, to_port, cidr_blocks]
  }
}

resource "aws_security_group_rule" "deny_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.0.0/16"]
  description       = "Deny all outbound traffic"
  security_group_id = aws_security_group.default.id
  lifecycle {
    ignore_changes = [cidr_blocks, from_port, to_port, protocol]
  }
}