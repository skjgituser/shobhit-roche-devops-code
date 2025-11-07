output "my-ec2-public-ip" {
  value = aws_instance.example[*].public_ip
}

output "my-ec2-ID" {
  value = aws_instance.example[*].id
}

resource "local_file" "foo" {
  #content  = join("\n",aws_instance.example[*].public_ip)
  content  = join("\n", concat(["[shob-web]"], aws_instance.example[*].public_ip))
  filename = "${path.module}/ansible-inventory.txt"
  #making manual dependency
  depends_on = [ aws_instance.example ]
}
