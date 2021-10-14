resource "aws_vpc" "mainn" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "automation-vpc"
  }
}

resource "aws_subnet" "week_4_us_east_1a" {
  vpc_id                  = aws_vpc.mainn.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "automation-sub-a"
  }
}

resource "aws_subnet" "week_4_us_east_1b" {
  vpc_id            = aws_vpc.mainn.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "automation-sub-b"
  }
}
