#data "aws_availability_zones" "all" {}

resource "aws_launch_configuration" "web-launch-config" {
  image_id        = "ami-0c1a7f89451184c8b"
  instance_type   = "t3.medium"
  key_name        = aws_key_pair.ubuntu.key_name
  security_groups = [aws_security_group.webserver-ssh-http-icmp.id]
  user_data       = file("install_apache.sh")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web-asg" {
  launch_configuration = aws_launch_configuration.web-launch-config.id
  #availability_zones   = data.aws_availability_zones.all.names
  #availability_zones = ["ap-south-1a"]
  vpc_zone_identifier = [aws_subnet.pri-subnet.id]
  #subnet_id          = aws_subnet.pri-subnet.id

  min_size         = "3"
  max_size         = "6"
  desired_capacity = "3"

  load_balancers    = [aws_elb.bar.name]
  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "web-asg"
    propagate_at_launch = true
  }
}
