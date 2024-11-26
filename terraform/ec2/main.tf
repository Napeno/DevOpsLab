# resource "aws_iam_instance_profile" "ec2_profile" {
#   name = "ec2-profile"
#   role = aws_iam_role.ec2_role.name
# }

# resource "aws_iam_role" "ec2_role" {
#   name = "ec2-role"

#   assume_role_policy = jsonencode({
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Sid": "Stmt1482712489000",
#             "Effect": "Allow",
#             "Action": [
#                 "iam:CreateRole",
#                 "iam:PutRolePolicy",
#                 "lambda:CreateFunction",
#                 "lambda:InvokeAsync",
#                 "lambda:InvokeFunction",
#                 "iam:PassRole",
#                 "lambda:UpdateAlias",
#                 "lambda:CreateAlias",
#                 "lambda:GetFunctionConfiguration",
#                 "lambda:AddPermission",
#                 "lambda:UpdateFunctionCode"
#             ],
#             "Resource": [
#                 "*"
#             ]
#         }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "ec2_role_policy" {
#   role       = aws_iam_role.ec2_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
# }

resource "aws_instance" "public" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  monitoring    = true
  ebs_optimized = true
  vpc_security_group_ids = [var.default_security_group_id]
  iam_instance_profile = "cloudwatch"
  root_block_device {
    encrypted = true
  }
  metadata_options {
    http_tokens = "required"
  }
  tags = {
    Name = "Public Instance"
  }
}

resource "aws_instance" "private" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  monitoring    = true
  ebs_optimized = true
  iam_instance_profile = "cloudwatch"
  vpc_security_group_ids = [var.default_security_group_id]
  root_block_device {
    encrypted = true
  }
  metadata_options {
    http_tokens = "required"
  }
  tags = {
    Name = "Private Instance"
  }
}


# resource "aws_security_group_rule" "default_deny_all" {
#   type        = "ingress"
#   from_port   = 0
#   to_port     = 0
#   protocol    = "-1"
#   cidr_blocks = ["10.0.0.0/16"]  
#   description = "Default deny all ingress traffic"
#   security_group_id = var.default_security_group_id 
#   lifecycle {
#     ignore_changes = [cidr_blocks, from_port, to_port, protocol]
#   }
# }

