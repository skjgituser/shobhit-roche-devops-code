terraform {
  backend "s3" {
    bucket = "shobhit-roche-terraform-bucket"
    key = "dev/shobhit/terraform.tfstate"
    dynamodb_table = "shobhit-roche-table-1"
    region = "ap-southeast-2"
    encrypt = true
  }
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