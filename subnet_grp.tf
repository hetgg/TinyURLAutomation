
resource "aws_db_subnet_group" "week14_subnet_group" {
  name       = "week_14_main"
  subnet_ids = [aws_subnet.week14-pri-a.id, aws_subnet.week14-pri-b.id]

  tags = {
    Name = "week-13 DB subnet group"
  }
}
