variable "name" {
    type = string
}    
variable "machine_type" {
    type = string
    description = "The type of ec2 vm that will be created"
    default = "t2.micro"
}

variable "ami" {
    type = string
}

variable subnet_id {
    type = string
}
variable vpc_id {
    type = string
}

variable "repo" {
    type = string
    description = "The repo to clone to get the website content"
}
variable "web_folder" {
    type = string
    description = "The folder inside the repo that contains the static website"
}
variable "env" {
    type = string
    description = "The environment that is deployed dev/preprod/prod)"
}