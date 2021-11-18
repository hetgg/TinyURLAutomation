resource "aws_autoscaling_group" "week12-asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  name = "week12-bastion-asg"
 


  launch_template {
    id      = aws_launch_template.week12-lt.id
    version = "$Latest"
}

}
