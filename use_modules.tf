provider "aws" {
  region = "ap-southeast-2"
}

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

module "my-shobhit-mudule-ec2" {
    source = "./modules/ec2"
    vm-name = "shobhit-vm-module"
    vm-size = "t2.nano"
    ec2-key-name = "shob-day3-key-by-module"
    shob-ami-id = "ami-0a25a306450a2cba3"
    private-key-algo="RSA"
    key-size=4096
    my-vpc-id = "vpc-02d56e9aa1ce2f114"
    my-sec-group-name="shob-sec-group-by-module"
    novm=2
}