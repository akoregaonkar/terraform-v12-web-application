resource "aws_instance" "bastion-server" {
  ami               = var.instance-ami
  instance_type     = var.instance-type
  availability_zone = var.instance-az
  subnet_id         = aws_subnet.pub-subnet.id
  key_name          = aws_key_pair.ubuntu.key_name
  security_groups   = ["${aws_security_group.bastion-ssh-icmp.id}"]
  tags = {
    Name = "bastion-server"
  }
}

resource "aws_instance" "web-pri" {
  ami               = var.instance-ami
  instance_type     = var.instance-type
  availability_zone = var.instance-az
  subnet_id         = aws_subnet.pri-subnet.id
  key_name          = aws_key_pair.ubuntu.key_name
  security_groups   = ["${aws_security_group.webserver-ssh-http-icmp.id}"]
  user_data         = file("install_apache.sh")
  tags = {
    Name = "web-pri"
  }
}

resource "aws_key_pair" "ubuntu" {
  key_name   = "ubuntu"
  public_key = file("id_rsa-pub")
}
