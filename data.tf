data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_vpc" "vpc" {
  tags = {
    Name = "${local.default_name}-vpc"
  }
}