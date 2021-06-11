# terraform-v12-web-application

- Terraform Version: `v0.12.31`

- Default Region: `ap-south-1`

#### SSH key pair
- Private and Public SSH key intentionally put in repo for demo.
- IMPORTANT: Please make sure that you use diff Private-Public key pair.

#### Network
- Public Subnet: `10.0.1.0/24`
  - Bastion Server (Helpful to access server from private subnet)
  - ELB
  - NAT Gateway (For ec2 instances in private subnet)
- Private Subnet: `10.0.2.0/24`
  - Web servers

#### Auto scaling group:
- Min: 3
- Desired: 3
- Max: 6

#### Output: 
- ELB DNS
