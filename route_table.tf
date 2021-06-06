resource "aws_route_table" "public" {
  vpc_id = aws_vpc.webapplication.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  #  route {
  #    cidr_block             = "10.0.1.0/24"
  #    destination_cidr_block = "10.0.2.0/24"
  #  }
  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.webapplication.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.pub-subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.pri-subnet.id
  route_table_id = aws_route_table.private.id
}
