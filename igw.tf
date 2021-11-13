resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-week10.id

  tags = {
    Name = "week10-igw"
  }
}
