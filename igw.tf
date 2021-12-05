resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-week13.id

  tags = {
    Name = "week13-igw"
  }
}
