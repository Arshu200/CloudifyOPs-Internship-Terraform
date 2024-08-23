output "SG_id" {
  value = aws_instance.instance1.vpc_security_group_ids
}

output "instanceid" {
  value = aws_instance.instance1.id
}



