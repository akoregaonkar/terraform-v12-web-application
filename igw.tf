resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.webapplication.id

  tags = {
    Name = "webapplication-gw"
  }
}
