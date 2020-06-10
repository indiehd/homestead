#!/bin/sh

echo 'Customizing NGINX/PHP...'

mkdir -p /etc/nginx/php.d

# Copy top-level custom config files.

cp -f /vagrant/scripts-custom/configs/nginx/conf.d/* /etc/nginx/conf.d/

chmod 644 /etc/nginx/conf.d/*

# Copy any other custom config files.

cp -f /vagrant/scripts-custom/configs/nginx/php.d/* /etc/nginx/php.d/

chmod -R 644 /etc/nginx/php.d

systemctl restart nginx
