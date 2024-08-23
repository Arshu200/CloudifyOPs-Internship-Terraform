output "public_ip" {
  value = module.instance.public_ip
}

output "instance_id" {
  value = module.instance.instance_id
}

output "security_group_id" {
  value = module.instance.security_group
}