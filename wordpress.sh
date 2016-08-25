#!/usr/bin/env bash

apt-get install -y zip

# Load password config
source ./config.sh

cd /usr/share/nginx/html

# Download latest WordPress
wget https://wordpress.org/latest.zip

# Unzip
unzip latest.zip

cd wordpress

# Set up config file
mv wp-config-sample.php wp-config.php
sed -i "s'database_name_here'${WP_DB_NAME}'" wp-config.php
sed -i "s'username_here'${MYSQL_WP_USER}'" wp-config.php
sed -i "s'password_here'${MYSQL_WP_PASSWORD}'" wp-config.php

# Create WordPress DB User
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${WP_DB_NAME}"
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "grant all privileges on ${WP_DB_NAME}.* to '${MYSQL_WP_USER}'@'localhost' identified by '${MYSQL_WP_PASSWORD}'"
