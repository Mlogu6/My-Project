locals {
  default_name = "${var.env}-${var.product}"
  env          = var.env
  account_id   = data.aws_caller_identity.current.account_id
  tags = merge({
    Terraform   = "true"
    Environment = var.env
    AccountID   = data.aws_caller_identity.current.account_id
  })
}