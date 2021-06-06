resource "aws_elb" "bar" {
  name = "elb-pub-subnet"
  #availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  subnets         = [aws_subnet.pub-subnet.id]
  security_groups = [aws_security_group.ssh.id]
  #access_logs {
  #  bucket        = "foo"
  #  bucket_prefix = "bar"
  #  interval      = 60
  #}

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  #listener {
  #  instance_port     = 8000
  #  instance_protocol = "http"
  #  lb_port           = 443
  #  lb_protocol       = "https"
  #  #  ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  #}

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [aws_instance.web-pri.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "elb-pub-subnet"
  }
}
