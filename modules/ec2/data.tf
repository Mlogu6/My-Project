data "aws_vpc" "vpc" {
  tags = {
    Name = "${local.default_name}-vpc"
  }
}

data "aws_subnet" "public" {
  availability_zone = "ap-south-1a"
  tags = {
    Name = "${local.default_name}-subnet-public"
  }
}

data "aws_security_group" "test" {
  tags = {
    Name        = "${local.default_name}-sg"
    Environment = var.env
  }
}

data "aws_caller_identity" "current" {}
