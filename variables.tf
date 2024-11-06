variable "machine_type" {
    type = string
    description = "The type of ec2 vm that will be created"
    default = "t2.micro"
}

variable "env" {
    type = string
    description = "The environment that is deployed dev/preprod/prod)"
}