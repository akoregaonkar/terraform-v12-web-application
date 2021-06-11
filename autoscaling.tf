resource "aws_launch_configuration" "web-launch-config" {
  image_id        = var.instance-ami
  instance_type   = var.instance-type
  key_name        = aws_key_pair.ubuntu.key_name
  security_groups = [aws_security_group.webserver-ssh-http-icmp.id]
  user_data       = file("install_apache.sh")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web-asg" {
  launch_configuration = aws_launch_configuration.web-launch-config.id
  vpc_zone_identifier  = [aws_subnet.pri-subnet.id]
  min_size             = var.min-instance-into-asg
  max_size             = var.max-instance-into-asg
  desired_capacity     = var.desired-instance-into-asg

  load_balancers    = [aws_elb.my-elb.name]
  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "web-asg"
    propagate_at_launch = true
  }
}
