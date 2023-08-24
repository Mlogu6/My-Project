module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name                   = "${local.default_name}-vpc"
  cidr                   = var.vpc_cidr
  azs                    = var.availability_zones
  public_subnets         = var.public_subnets
  private_subnets        = var.private_subnets
  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true
  enable_dns_hostnames   = true
  enable_dns_support     = true
  # enable_flow_log        = true
  # flow_log_destination_type = "s3"
  # flow_log_destination_arn  = module.logs_s3.s3_bucket_arn

  # vpc_flow_log_tags = local.tags

  tags = merge(local.tags, {
    Name = "${local.default_name}-vpc"
  })

  private_subnet_tags = merge(local.tags, {
    Name = "${local.default_name}-subnet-private"
    Type = "private"
  })

  public_subnet_tags = merge(local.tags, {
    Name = "${local.default_name}-subnet-public"
    Type = "public"
  })
}

module "ec2" {
  source                 = "./modules/ec2"
  ami                    = var.ami # Replace with the desired AMI ID
  instance_type          = var.instance_type
  key_name               = var.key_name # Replace with your SSH key pair name
  # vpc_security_group_ids = module.security_group.security_group_id
  env                    = var.env
  product                = var.product
}
