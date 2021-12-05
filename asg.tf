resource "aws_autoscaling_group" "week13-asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  name = "week13-bastion-asg"
 


  launch_template {
    id      = aws_launch_template.week13-lt.id
    version = "$Latest"
}

}
