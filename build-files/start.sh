#!/bin/bash
LOCKFILE=/var/run/apache2/apache2.pid

chown www-data:www-data /var/www/html -R

if [ "$ALLOW_OVERRIDE" = "**False**" ]; then
    unset ALLOW_OVERRIDE
else
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
    a2enmod rewrite
fi

rm $LOCKFILE
cron
service rsyslog start
service ssh start
chown web:web -R /home/web
source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND
