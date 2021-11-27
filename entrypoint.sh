#!/bin/ash
set -e

if [ -n "${REVIVE_DOMAIN}" ]; then
  echo "REVIVE_DOMAIN variable set. Checking for configuration"
  if [ ! -f "/var/www/html/var/${REVIVE_DOMAIN}.conf.php" ]; then
    echo "Configuration not found, generating dynamic configuration"
    REVIVE_DB_PREFIX="${REVIVE_DB_PREFIX:-rv_}"
    REVIVE_DB_TYPE="${REVIVE_DB_TYPE:-mysqli}"
    TMP_RAND_STRING=$(LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c 32 | base64)
    REVIVE_DELIVERY_SECRET="${REVIVE_DELIVERY_SECRET:-$TMP_RAND_STRING}"
    REVIVE_APPLICATION_NAME="${REVIVE_APPLICATION_NAME:-Revive}"
    REVIVE_ASYNC_JS_SCRIPT="${REVIVE_ASYNC_JS_SCRIPT:-new-async}"
    envsubst < /usr/local/conf.tmpl > "/var/www/html/var/${REVIVE_DOMAIN}.conf.php"
    echo "Created new config and stored it in /var/www/html/var/${REVIVE_DOMAIN}.conf.php"
  else
    echo "Configuration file already exist, ignoring creation of dynamic configuration"
  fi
fi

echo "Correcting file permissions for required directories"
chmod -R a+w /var/www/html/var
chmod -R a+w /var/www/html/plugins
chmod -R a+w /var/www/html/www/admin/plugins
chmod -R a+w /var/www/html/www/images

echo "Ready to start php-fpm..."

exec entrypoint "$@"
