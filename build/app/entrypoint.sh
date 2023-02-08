#!/bin/bash

php /var/www/artisan migrate --force
php /var/www/artisan permission:init

/usr/bin/supervisord -n -c /etc/supervisord.conf
