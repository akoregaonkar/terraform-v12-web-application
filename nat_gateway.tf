resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.eip-to-nat.id
  subnet_id     = aws_subnet.pub-subnet.id
  tags = {
    Name = "k8s-nat-gw"
  }
}

resource "aws_eip" "eip-to-nat" {
  vpc        = true
  depends_on = [aws_internet_gateway.gw]
  tags = {
    Name = "k8s-eip"
  }
}
