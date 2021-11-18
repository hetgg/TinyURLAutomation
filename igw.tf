resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-week12.id

  tags = {
    Name = "week12-igw"
  }
}
