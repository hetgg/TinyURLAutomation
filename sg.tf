resource "aws_security_group" "week13"{
  name = "week13-ssh-sg"
description = "AllowSSHinboundtraffic"
  vpc_id =  aws_vpc.main-week13.id

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
      Name = "week13-ssh-sg"
  }
}


#------------------------New SG for bastion -------------------
#------------------------Useless for week13 -------------------

resource "aws_security_group" "private-sg" {
  name        = "week13-ssh-pri-sg"
  description = "AllowSSHinboundtraffic"
  vpc_id      = aws_vpc.main-week13.id

  ingress = [
    {
      description = "SSH from VPC"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = []

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.week13.id]
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
    Name = "week13-ssh-pri-sg"
  }
}



#------------------------SG for RDS DB  -------------------

resource "aws_security_group" "week13-rds-sg" {
  name        = "week13-ssh-rds-sg"
  description = "AllowSSHinboundtraffic"
  vpc_id      = aws_vpc.main-week13.id

  ingress = [
    {
      description = "SSH from VPC"
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
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
    Name = "week13-ssh-rds-sg"
  }
}



#--------------------------------Default SG for-------------------


resource "aws_default_security_group" "week13-def-sg" {
  vpc_id = aws_vpc.main-week13.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

