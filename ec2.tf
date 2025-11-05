resource "aws_instance" "example" {
  #ami           = "ami-0a25a306450a2cba3"
  ami = var.shob-ami-id
  #nstance_type = "t2.nano"
  instance_type = var.vm-size
  #key_name      = "roche-key"
  key_name = var.ec2-key-name
  tags = {
    "Name" : var.vm-name
  }

}