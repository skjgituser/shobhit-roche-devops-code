variable "shob-ami-id" {
    type = string
    description = "this is my sydney aws region AMI Id"
    #default = "ami-0a25a306450a2cba3" 
}

variable "vm-name" {
    type = string
    description = "my aws vm-name"
  
}

variable "vm-size" {
    type = string
  
}

variable "ec2-key-name" {
    type = string
  
}

variable "private-key-algo" {
    type = string
  
}

variable "key-size" {
    type = number
  
}

variable "my-vpc-id" {
  
}

variable "my-sec-group-name" {
  
}

variable "novm" {
  
}