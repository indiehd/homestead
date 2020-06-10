#!/bin/sh

echo 'Installing PHP extensions and configuring...'

pecl channel-update pecl.php.net

# For avoiding prompts related to locally-modified files that belong to packages.
# See: https://stackoverflow.com/a/21256272/1772379

DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" install -yq php-redis

mkdir -p /etc/php/mods-available

# php.ini Customization

cp -f /vagrant/scripts-custom/configs/php.ini /etc/php/mods-available/my-customizations.ini
chown root:root /etc/php/mods-available/my-customizations.ini && chmod 644 /etc/php/mods-available/my-customizations.ini
ln -sf /etc/php/mods-available/my-customizations.ini /etc/php/5.6/fpm/conf.d/50-my-customizations.ini
ln -sf /etc/php/mods-available/my-customizations.ini /etc/php/7.0/fpm/conf.d/50-my-customizations.ini
ln -sf /etc/php/mods-available/my-customizations.ini /etc/php/7.1/fpm/conf.d/50-my-customizations.ini
ln -sf /etc/php/mods-available/my-customizations.ini /etc/php/7.2/fpm/conf.d/50-my-customizations.ini
ln -sf /etc/php/mods-available/my-customizations.ini /etc/php/7.3/fpm/conf.d/50-my-customizations.ini
ln -sf /etc/php/mods-available/my-customizations.ini /etc/php/7.4/fpm/conf.d/50-my-customizations.ini

# xdebug Customization

cp -f /vagrant/scripts-custom/configs/xdebug.ini /etc/php/mods-available/xdebug.ini
chown root:root /etc/php/mods-available/xdebug.ini && chmod 644 /etc/php/mods-available/xdebug.ini
ln -sf /etc/php/mods-available/xdebug.ini /etc/php/5.6/fpm/conf.d/50-xdebug.ini
ln -sf /etc/php/mods-available/xdebug.ini /etc/php/7.0/fpm/conf.d/50-xdebug.ini
ln -sf /etc/php/mods-available/xdebug.ini /etc/php/7.1/fpm/conf.d/50-xdebug.ini
ln -sf /etc/php/mods-available/xdebug.ini /etc/php/7.2/fpm/conf.d/50-xdebug.ini
ln -sf /etc/php/mods-available/xdebug.ini /etc/php/7.3/fpm/conf.d/50-xdebug.ini
ln -sf /etc/php/mods-available/xdebug.ini /etc/php/7.4/fpm/conf.d/50-xdebug.ini

systemctl restart php5.6-fpm
systemctl restart php7.0-fpm
systemctl restart php7.1-fpm
systemctl restart php7.2-fpm
systemctl restart php7.3-fpm
systemctl restart php7.4-fpm
