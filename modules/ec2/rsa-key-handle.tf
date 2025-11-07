resource "tls_private_key" "example" {
  algorithm = var.private-key-algo
  rsa_bits  = var.key-size
}

resource "local_file" "private-key-data" {
  content  = tls_private_key.example.private_key_pem
  filename = "${path.module}/shobhitKey.pem"
  file_permission = 0400
  depends_on = [ tls_private_key.example ]
}

resource "aws_key_pair" "example" {
  public_key = tls_private_key.example.public_key_openssh
  key_name = var.ec2-key-name
  depends_on = [ tls_private_key.example ]
}