terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}




resource "local_file" "foo" {
  content  = aws_instance.example.public_ip
  filename = "${path.module}/myip.txt"
  #making manual dependency
  depends_on = [ aws_instance.example ]
}