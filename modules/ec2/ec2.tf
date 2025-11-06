resource "aws_instance" "example" {
  count=var.novm
  ami = var.shob-ami-id
  instance_type = var.vm-size
  key_name = aws_key_pair.example.key_name
  #security_groups = [ aws_security_group.allow_tls.name ]
  vpc_security_group_ids = [aws_security_group.allow_tls.id  ]

  tags = {
    "Name" : "${var.vm-name}-${count.index}"
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