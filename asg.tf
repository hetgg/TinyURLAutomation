resource "aws_autoscaling_group" "week14-asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  name = "week14-bastion-asg"
 


  launch_template {
    id      = aws_launch_template.week14-lt.id
    version = "$Latest"
}

}
