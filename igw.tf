resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-week9.id

  tags = {
    Name = "week9-igw"
  }
}
