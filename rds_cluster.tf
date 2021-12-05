resource "aws_rds_cluster" "week14-rds" {
  cluster_identifier      = "week14-rds"
  engine                  = "aurora-mysql"
  engine_mode             = "serverless"

  database_name           = "week14_rds"
  master_username         = "admin"
  master_password         = "secret123"
  skip_final_snapshot     =  true
  db_subnet_group_name    =  aws_db_subnet_group.week14_subnet_group.name
  vpc_security_group_ids = [ aws_security_group.week14-rds-sg.id ]
 scaling_configuration {
  auto_pause      = true
  min_capacity = 1
  max_capacity = 2
  seconds_until_auto_pause = 300  #300 sec i.e 5 min
  }
}
  output "week14-rds-endpoint" { 
  value = aws_rds_cluster.week14-rds.endpoint 
} 



