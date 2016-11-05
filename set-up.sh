#!/usr/bin/env bash

# Change to script directory
sd=`dirname $0`
cd $sd

# Update apt-get
apt-get update -y

# Update Ubuntu
apt-get -y upgrade
apt-get -y dist-upgrade

# Install PHP5
# apt-get install -y php5

# Install MySQL
source ./config.sh
debconf-set-selections <<< "mysql-server mysql-server/root_password password ${MYSQL_ROOT_PASSWORD}"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password ${MYSQL_ROOT_PASSWORD}"
apt-get -y install mysql-server

# Install php-mysql module
apt-get install -y php5-mysql

# Install PHP FPM
apt-get install -y php5-fpm

# Configure PHP
#
# If this number is kept as 1, the php interpreter will do its best to process the file that is as
# near to the requested file as possible. This is a possible security risk. If this number is set to
# 0, conversely, the interpreter will only process the exact file path—a much safer alternative. See
# https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-12-04
echo "cgi.fix_pathinfo=0" >> /etc/php5/fpm/php.ini

# Restart PHP FPM
service php5-fpm restart

# Install nginx
apt-get install -y nginx
cp nginx/default /etc/nginx/sites-available
service nginx restart

# Install wordpress
./wordpress.sh
