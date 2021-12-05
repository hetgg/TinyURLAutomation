resource "aws_vpc" "main-week13" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
   tags = {
    Name = "week13-vpc"
  }
}

resource "aws_subnet" "week_11_us_east_1b" {
  vpc_id                  = aws_vpc.main-week13.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "week13-sub-a"
  }
}

resource "aws_subnet" "week_11_us_east_1a" {
  vpc_id            = aws_vpc.main-week13.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "week13-sub-b"
  }
}

#private subs

resource "aws_subnet" "week13-pri-a" {
  vpc_id            = aws_vpc.main-week13.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "week13-pri-a"
  }
}

resource "aws_subnet" "week13-pri-b" {
  vpc_id            = aws_vpc.main-week13.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "week13-pri-b"
  }
}




