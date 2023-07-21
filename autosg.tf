 # asg.tf
resource "aws_autoscaling_group" "fullstack-asg-01" {
  name                      = "fullstack-asg"
  min_size                  = 2
  max_size                  = 10
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  target_group_arns         = [aws_alb_target_group.fullstack-alb-tg.arn]
  launch_configuration      = aws_launch_configuration.ec2.name
  vpc_zone_identifier       = [aws_subnet.publicSubnet1.id, aws_subnet.publicSubnet2.id]
}

resource "aws_launch_configuration" "ec2" {
  name_prefix = "ec2-"

  image_id      = "ami-063db2954fe2eec9f"
  instance_type = "t2.nano"
  key_name      = "deploy_04_cdh"

  security_groups             = [aws_security_group.publicSG01.id]
  associate_public_ip_address = true

  user_data                   = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}