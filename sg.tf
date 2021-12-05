resource "aws_security_group" "week14"{
  name = "week14-ssh-sg"
description = "AllowSSHinboundtraffic"
  vpc_id =  aws_vpc.main-week14.id

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
      Name = "week14-ssh-sg"
  }
}


#------------------------New SG for bastion -------------------
#------------------------Useless for week14 -------------------

resource "aws_security_group" "private-sg" {
  name        = "week14-ssh-pri-sg"
  description = "AllowSSHinboundtraffic"
  vpc_id      = aws_vpc.main-week14.id

  ingress = [
    {
      description = "SSH from VPC"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = []

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.week14.id]
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
    Name = "week14-ssh-pri-sg"
  }
}



#------------------------SG for RDS DB  -------------------

resource "aws_security_group" "week14-rds-sg" {
  name        = "week14-ssh-rds-sg"
  description = "AllowSSHinboundtraffic"
  vpc_id      = aws_vpc.main-week14.id

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
    Name = "week14-ssh-rds-sg"
  }
}



#--------------------------------Default SG for-------------------


resource "aws_default_security_group" "week14-def-sg" {
  vpc_id = aws_vpc.main-week14.id

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

