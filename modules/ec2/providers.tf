resource "local_file" "foo" {
  content  = join("\n",aws_instance.example[*].public_ip)
  filename = "${path.module}/myip.txt"
  #making manual dependency
  depends_on = [ aws_instance.example ]
}
