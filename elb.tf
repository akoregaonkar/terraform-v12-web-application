resource "aws_elb" "my-elb" {
  name            = "elb-pub-subnet"
  subnets         = [aws_subnet.pub-subnet.id]
  security_groups = [aws_security_group.webserver-ssh-http-icmp.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

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
