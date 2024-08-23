output "instance_id" {
  value = aws_instance.instance.id
}

output "public_ip" {
  value = aws_instance.instance.public_ip
}

output "security_group" {
  value = aws_security_group.ssh_sg.id
}