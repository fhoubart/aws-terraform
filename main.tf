terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74"
    }
  }
  backend "s3" {
    bucket = "tf-state-lab-florent"
    key    = "tf-state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

# resource "aws_s3_bucket" "tf-state" {
#   bucket = "tf-state-lab-florent"

#   tags = {
#     Name        = "Terraform remote state"
#     Environment = "Dev"
#   }
# }

module "webserver1" {
    source = "./webserver"
    name = "webserver1-${var.env}"
    machine_type = var.machine_type
    ami = "ami-06b21ccaeff8cd686"
    subnet_id = aws_subnet.public.id
    vpc_id = aws_subnet.public.vpc_id
    repo = "https://fhoubart@bitbucket.org/fhoubart/testphaser_aws.git"
    web_folder = "public_html"
    env = var.env
}

module "webserver2" {
    source = "./webserver"
    name = "webserver2-${var.env}"
    machine_type = var.machine_type
    ami = "ami-06b21ccaeff8cd686"
    subnet_id = aws_subnet.public.id
    vpc_id = aws_subnet.public.vpc_id
    repo = "https://github.com/doersino/nyum.git"
    web_folder = "_site"
    env = var.env
}

