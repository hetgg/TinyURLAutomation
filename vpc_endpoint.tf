resource "aws_vpc_endpoint" "week12-ec2-ep" {
  vpc_id       = aws_vpc.main-week12.id
  service_name = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type = "Interface"
  security_group_ids = [aws_security_group.week12-https-sg.id]
  subnet_ids = [aws_subnet.week12-pri-a.id, aws_subnet.week12-pri-b.id]
  private_dns_enabled = true
tags = {
    Name = "week12-ec2-ep"
  }
}


resource "aws_vpc_endpoint" "week12-sqs-ep" {
  vpc_id       = aws_vpc.main-week12.id
  service_name = "com.amazonaws.us-east-1.sqs"
  vpc_endpoint_type = "Interface"
  security_group_ids = [aws_security_group.week12-https-sg.id]
  subnet_ids = [aws_subnet.week12-pri-a.id, aws_subnet.week12-pri-b.id]
  private_dns_enabled = true
tags = {
    Name = "week12-sqs-ep"
  }
}
