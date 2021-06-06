#output "Master-EC2-Public-IP" {
#  value = aws_instance.web-pub.public_ip
#}

output "Slave-EC2-Public-IP" {
  value = aws_instance.web-pri.private_ip
}

output "ELB" {
  value = aws_elb.bar.dns_name
}
