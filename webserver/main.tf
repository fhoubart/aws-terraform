resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.machine_type

  associate_public_ip_address = "true"
  subnet_id = var.subnet_id
  
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<EOF
yum update -y
yum install git
amazon-linux-extras install nginx1.12
systemctl start nginx sudo systemctl enable nginx
mkdir /app
cd /app
git clone ${var.repo}
rm -rf /var/www/html
mv ${var.web_folder} /var/www.html
echo 'server { listen 80; server_name mywebsite.com www.mywebsite.com; location / { root /var/www/html; index index.html; } }' > /etc/nginx/conf.d/mywebsite.conf

EOF

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

resource "aws_eip" "publicip" {
  network_interface = "${aws_network_interface.interface.id}"
}



