/*terraform {
  required_providers{
    aws ={
      source = "hashicrop/aws"
      version = "~> 3.50.0"
    }
  }
}
*/


terraform {
  backend "s3" {
    bucket = "terraformtfstatehari"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}






variable "vpc_id" {}
variable "subnet_id" {}


data "aws_vpc" "desu" {
  id = var.vpc_id
}

#resource "aws_vpc" "desu" {}

data "aws_subnet_ids" "desu_subnet1" {
  vpc_id = var.vpc_id
}

resource "aws_instance" "hari" {
  count         = 1
  ami           = "ami-0dc2d3e4c0f9ebd18"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id

  tags = {
    name = "newInstanceOnOldVpc ${count.index}"
  }
}
/*
resource "aws_security_group" "tf_security" {
  name =  "tf-sg"
  vpc_id = data.aws_vpc.desu
   ingress {
     description = "Port 22"
  }
}

provider "local-exec" {
  command = "echo ${self.public_ip} > hari_ip.txt"
}*/