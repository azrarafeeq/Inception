#!/bin/sh

wp --allow-root --path=/var/www core install \
  --url="$DOMAIN_NAME" \
  --title="Azra Rafeeq's WordPress" \
  --admin_user="$WPADUSER" \
  --admin_password="$WPADPASS" \
  --admin_email="arafeeq@student.42abudhabi.ae"

wp user create "$WPUSER1" "user1@student.42abudhabi.ae" \
  --role=author \
  --user_pass="$WPUSER1PASS" \
  --allow-root

wp theme install twentytwenty --activate --allow-root

wp plugin update --all --allow-root

/usr/sbin/php-fpm8 -F
