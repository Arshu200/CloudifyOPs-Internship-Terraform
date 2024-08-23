output "securitygroup" {
  value = tolist(aws_instance.my_instance.vpc_security_group_ids)[0]
}