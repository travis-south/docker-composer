#!/bin/sh
cd /var/www/html/app
echo "currently in `pwd`"
composer $@
