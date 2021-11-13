resource "aws_vpc" "main-week10" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
   tags = {
    Name = "week10-vpc"
  }
}

resource "aws_subnet" "week_10_us_east_1b" {
  vpc_id                  = aws_vpc.main-week10.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "week10-sub-a"
  }
}

resource "aws_subnet" "week_10_us_east_1a" {
  vpc_id            = aws_vpc.main-week10.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "week10-sub-b"
  }
}

#private subs

resource "aws_subnet" "week10-pri-a" {
  vpc_id            = aws_vpc.main-week10.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "week10-pri-a"
  }
}

resource "aws_subnet" "week10-pri-b" {
  vpc_id            = aws_vpc.main-week10.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "week10-pri-b"
  }
}




