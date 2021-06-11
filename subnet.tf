resource "aws_subnet" "pub-subnet" {
  vpc_id                  = aws_vpc.webapplication.id
  cidr_block              = var.public-cidr
  availability_zone       = var.instance-az
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-subnet"
  }
}

resource "aws_subnet" "pri-subnet" {
  vpc_id                  = aws_vpc.webapplication.id
  cidr_block              = var.private-cidr
  availability_zone       = var.instance-az
  map_public_ip_on_launch = false

  tags = {
    Name = "pri-subnet"
  }
}
