output "my-ec2-public-ip" {
  value = aws_instance.example.public_ip
}

output "my-ec2-ID" {
  value = aws_instance.example.id
}

