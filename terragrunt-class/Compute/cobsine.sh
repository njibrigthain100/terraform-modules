#!/bin/bash
########################################
######## INSTALLING THE WEBSITE   ######
########################################
sudo su - 
yum update -y
yum install -y httpd
mkdir temp
cd temp
wget https://www.free-css.com/assets/files/free-css-templates/download/page286/cobsine.zip
unzip cobsine.zip
mv html/* /var/www/html/
systemctl enable httpd
systemctl start httpd