#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Deployed via Terraform inside Private Subnet and behind LB</h1>" | sudo tee /var/www/html/index.html
