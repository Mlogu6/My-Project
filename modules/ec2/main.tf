module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  for_each                    = toset(["Jenkins", "Sonarqube", "Ansible"])
  name                        = "${local.default_name}-${each.key}"
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [data.aws_security_group.test.id]
  subnet_id                   = data.aws_subnet.public.id
  associate_public_ip_address = true

  tags = {
    Name = "${local.default_name}-instance-${each.key}"
    Env  = var.env
  }
}
