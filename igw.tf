resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mainn.id

  tags = {
    Name = "automation-igw"
  }
}
