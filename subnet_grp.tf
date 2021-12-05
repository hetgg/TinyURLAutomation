resource "aws_db_subnet_group" "week13_subnet_group" {
  name       = "week_13_main"
  subnet_ids = [aws_subnet.week13-pri-a.id, aws_subnet.week13-pri-b.id]

  tags = {
    Name = "week-13 DB subnet group"
  }
}
