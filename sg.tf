resource "aws_security_group" "week9"{
  name = "week9-ssh-sg"
  description = "AllowSSHinboundtraffic"
  vpc_id =  aws_vpc.main-week9.id

  ingress=[
    {
      description = "SSH from VPC"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

egress = [
  {
    description = "Allow all outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]


    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  }
  ]

  tags = {
      Name = "week9-ssh-sg"
  }
}


#------------------------New SG for bastion -------------------

resource "aws_security_group" "private-sg" {
  name        = "week9-ssh-pri-sg"
  description = "AllowSSHinboundtraffic"
  vpc_id      = aws_vpc.main-week9.id

  ingress = [
    {
      description = "SSH from VPC"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = []

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.week9.id]
      self             = false
    }
  ]

  egress = [
    {
      description = "Allow all outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]


      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "week9-ssh-pri-sg"
  }
}



