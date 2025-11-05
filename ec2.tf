resource "aws_instance" "example" {
  #ami           = "ami-0a25a306450a2cba3"
  ami = var.shob-ami-id
  #nstance_type = "t2.nano"
  instance_type = var.vm-size
  #key_name      = "roche-key"
  key_name = aws_key_pair.example.key_name
  tags = {
    "Name" : var.vm-name
  }
  
  #provisioner
  provisioner "remote-exec" {
    inline = [ 
       "sudo dnf install git httpd -y",
       "mkdir -p hello/terraform"

     ]
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key=tls_private_key.example.private_key_pem
    
  }

}