output "instance_id" {
  value = aws_instance.sajjan_web_server[0].id
}

output "public_ip" {
  value = aws_instance.sajjan_web_server[*].public_ip
}
