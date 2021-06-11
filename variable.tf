variable "instance-type" {
  description = "Instance type to be used"
  default     = "t3.medium"
}

variable "instance-ami" {
  description = "Instance AMI to be used"
  default     = "ami-0c1a7f89451184c8b"
}

variable "instance-az" {
  description = "Default availability_zone"
  default     = "ap-south-1a"
}

variable "min-instance-into-asg" {
  description = "Minimum instance count"
  default     = "3"
}

variable "max-instance-into-asg" {
  description = "Maximum instance count"
  default     = "6"
}

variable "desired-instance-into-asg" {
  description = "Desired instance count"
  default     = "3"
}

variable "private-cidr" {
  type        = string
  description = "Private subnet CIDR"
  default     = "10.0.2.0/24"
}

variable "public-cidr" {
  type        = string
  description = "Public subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "default-region" {
  description = "Default Region for VPC"
  default     = "ap-south-1"
}

#variable "public-key" {
#  description = "Default Region for VPC"
#  default     = "${path.module}/id_rsa.pub"
#}
#
#variable "install-pkgs" {
#  description = "Shell script to install required packages"
#  default     = "${path.module}/install_apache.sh"
#}
