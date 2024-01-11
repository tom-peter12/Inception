# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/05 17:19:36 by tpetros           #+#    #+#              #
#    Updated: 2024/01/05 17:19:40 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

wp --allow-root --path=/var/www core install \
  --url="$DOMAIN_NAME" \
  --title="Degef's WordPress" \
  --admin_user="$WPADUSER" \
  --admin_password="$WPADPASS" \
  --admin_email="dsium@student.42abudhabi.ae"

wp user create "$WPUSER1" "Natan@student.42abudhabi.ae" \
  --role=author \
  --user_pass="$WPUSER1PASS" \
  --allow-root

wp --allow-root --path=/var/www option update blogname "Amazing Things!"
wp --allow-root --path=/var/www option update blogdescription "Degef's Inception Project"
wp --allow-root --path=/var/www option update blog_public 0

REDIS CACHE
wp config set WP_CACHE true --allow-root
wp config set WP_CACHE_KEY_SALT 'dsium.42.fr' --allow-root

wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

# wp theme install inspiro --activate --allow-root
chown -R www-data:www-data /var/www/wp-content
chmod -R 755 /var/www/wp-content
mkdir -p /var/www/wp-content/upgrade/
wp theme install inspiro --activate --allow-root

wp plugin update --all --allow-root

/usr/sbin/php-fpm8 -F