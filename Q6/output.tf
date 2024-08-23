output "instance_type" {
  value = aws_instance.web.instance_type
}

output "instance_state" {
  value = aws_instance.web.instance_state
}

output "id" {
  value = aws_instance.web.id
}

output "sg-rules" {
  value = aws_instance.web.security_groups
}