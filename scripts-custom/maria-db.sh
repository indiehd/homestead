#!/bin/sh

echo 'Configuring MariaDB...'

cp -f /vagrant/scripts-custom/configs/maria-db.cnf /etc/mysql/conf.d/99-my-customizations.cnf
chown root:root /etc/mysql/conf.d/99-my-customizations.cnf && chmod 644 /etc/mysql/conf.d/99-my-customizations.cnf

systemctl restart mysql
