resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.machine_type

  network_interface {
    network_interface_id = aws_network_interface.interface.id
    device_index         = 0
  }

  tags = {
    Name = var.name
    Env = var.env
  }
}

resource "aws_network_interface" "interface" {
  subnet_id   = var.subnet_id

  tags = {
    Name = "primary_network_interface"
  }
}



