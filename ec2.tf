resource "aws_instance" "bastion-server" {
  ami             = "ami-0c1a7f89451184c8b"
  instance_type   = "t3.medium"
  availability_zone = "ap-south-1a"
  subnet_id       = aws_subnet.pub-subnet.id
  key_name        = aws_key_pair.ubuntu.key_name
  security_groups = ["${aws_security_group.bastion-ssh-icmp.id}"]
  tags = {
    Name = "bastion-server"
  }
}

resource "aws_instance" "web-pri" {
  ami               = "ami-0c1a7f89451184c8b"
  instance_type     = "t3.medium"
  availability_zone = "ap-south-1a"
  subnet_id         = aws_subnet.pri-subnet.id
  key_name          = aws_key_pair.ubuntu.key_name
  security_groups   = ["${aws_security_group.webserver-ssh-http-icmp.id}"]
  user_data         = file("install_apache.sh")
  tags = {
    Name = "web-pri"
  }
}

#resource "aws_eip" "ec2-eip" {
#  instance = aws_instance.k8s-master.id
#  vpc      = true
#  tags = {
#    Name = "k8s-master"
#  }
#}
#
#resource "aws_eip_association" "eip_assoc" {
#  instance_id   = aws_instance.k8s-master.id
#  allocation_id = aws_eip.ec2-eip.id
#}

resource "aws_key_pair" "ubuntu" {
  key_name   = "ubuntu"
  public_key = file("id_rsa-pub")
}
