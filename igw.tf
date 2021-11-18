resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-week11.id

  tags = {
    Name = "week11-igw"
  }
}
