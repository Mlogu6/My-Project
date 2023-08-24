output "ec2_id" {
  value = [for k in module.ec2_instance : k.id]
}

output "ec2_public_ip" {
  value = [for k in module.ec2_instance : k.public_ip]
}