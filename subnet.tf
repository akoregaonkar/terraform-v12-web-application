resource "aws_subnet" "pub-subnet" {
  vpc_id                  = aws_vpc.webapplication.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-subnet"
  }
}

resource "aws_subnet" "pri-subnet" {
  vpc_id                  = aws_vpc.webapplication.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "pri-subnet"
  }
}
