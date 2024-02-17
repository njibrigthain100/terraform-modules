#!/bin/bash
########################################
#### INSTALLING THE DOTNET WEBSITE ######
########################################
sudo su - 
yum update -y
yum install -y httpd
mkdir temp
cd temp
wget https://www.free-css.com/assets/files/free-css-templates/download/page281/dotnet.zip
unzip dotnet.zip
mv digital-agency-website-template/* /var/www/html/
systemctl enable httpd
systemctl start httpd
