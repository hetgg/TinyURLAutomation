resource "aws_launch_template" "week14-lt" {
  name = "week14-bastion-lt"

  /* block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
    }
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = 4
    threads_per_core = 2
  }


  credit_specification {
    cpu_credits = "standard"
  }


 ebs_optimized = true

  elastic_gpu_specifications {
    type = "test"
  }
*/

 /* elastic_inference_accelerator {
    type = "eia1.medium"
  }*/
 /* iam_instance_profile {
    name = "test"
  }
*/

  image_id = "ami-02e136e904f3da870"

  #instance_initiated_shutdown_behavior = "terminate"

  /* instance_market_options {
    market_type = "spot"
  }*/

  instance_type = "t2.micro"

  #kernel_id = "test"

  key_name = "ECE592b"

  #license_specification {
  #license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  #}

 /* metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  monitoring {
    enabled = true
  }
*/

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.week14.id]
    subnet_id                   = aws_subnet.week_11_us_east_1a.id
  }

  /*placement {
    availability_zone = "us-east-1a"
  }
*/
  #ram_disk_id = "test"

  #vpc_security_group_ids = [aws_security_group.week14.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "week14-bastion-vm"
    }
  }

  #user_data = filebase64("${path.module}/example.sh")
}
