#!/bin/sh
set -e

echo "Correcting file permissions for required directories."
chmod -R a+w /var/www/html/var
chmod -R a+w /var/www/html/plugins
chmod -R a+w /var/www/html/www/admin/plugins
chmod -R a+w /var/www/html/www/images
echo "Ready to start php-fpm..."

exec entrypoint "$@"
