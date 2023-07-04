#!/bin/sh

wp --allow-root --path=/var/www core install \
  --url="$DOMAIN_NAME" \
  --title="arafeeq Word-Press" \
  --admin_user="$WPADUSER" \
  --admin_password="$WPADPASS" \
  --admin_email="arafeeq@student.42abudhabi.ae"

wp user create "$WPUSER1" "user1@student.42abudhabi.ae" \
  --role=author \
  --user_pass="$WPUSER1PASS" \
  --allow-root
