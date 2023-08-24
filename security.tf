module "security_group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "~> 4.0"
  name        = "${local.default_name}-sg"
  description = "myproject security group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Allow access to ssh_host"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "allow 8080"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      description = "Allow all traffic"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  tags = local.tags
}
