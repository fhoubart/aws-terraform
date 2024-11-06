terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74"
    }
  }
  backend "s3" {
    bucket = "bucket-cf-template-s3"
    key    = "tf-state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

# resource "aws_s3_bucket" "tf-state" {
#   bucket = "bucket-cf-template"

#   tags = {
#     Name        = "Terraform remote state"
#     Environment = "Dev"
#   }
# }

resource "aws_instance" "web" {
  ami           = "ami-06b21ccaeff8cd686"
  instance_type = var.machine_type

  network_interface {
    network_interface_id = aws_network_interface.interface.id
    device_index         = 0
  }

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_network_interface" "interface" {
  subnet_id   = aws_subnet.public.id

  tags = {
    Name = "primary_network_interface"
  }
}

