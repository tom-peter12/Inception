# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup_wp.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/18 15:25:15 by tpetros           #+#    #+#              #
#    Updated: 2024/01/21 00:56:01 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
# if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
#     echo "WordPress is already installed in this directory."
#     exec "$@"
#     exit 0
# fi

if [ ! -d "/usr/local/bin/wp" ]; then
    cd /tmp
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -d "/var/www/html/wordpress" ]; then
        mkdir -p /var/www/html/wordpress
fi

chmod -R 755 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*

wp core download --allow-root

echo "Generating WordPress 'wp-config.php'..."
wp config create --path="/var/www/html/wordpress" --allow-root --dbname=$WP_DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWD --dbhost=$WP_HOST --dbprefix=wp_


echo "Installing WordPress deps..."
wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_EMAIL}

wp theme install hello-elementor --allow-root

wp theme activate hello-elementor --allow-root

wp core update

echo "Creating users..."

wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_PASSWD --allow-root

sed -i '/\/\* That'\''s all, stop editing! Happy publishing. \*\//i \
define( '\''WP_REDIS_HOST'\'', '\''redis'\'' );\n\
define( '\''WP_REDIS_PORT'\'', 6379 );\n\
define( '\''WP_REDIS_TIMEOUT'\'', 1 );\n\
define( '\''WP_REDIS_READ_TIMEOUT'\'', 1 );\n\
define( '\''WP_REDIS_DATABASE'\'', 0 );\n' wp-config.php

wp plugin install redis-cache --activate --allow-root

wp config set WP_CONTENT_DIR /var/www/html/wordpress/wp-content --type=constant --add --allow-root
wp config set WP_CONTENT_URL https://tpetros.42.fr/wordpress/wp-content --type=constant --add --allow-root


chmod -R 0777 /var/www/html/wordpress/*
chown -R www-data:www-data /var/www/html/wordpress/*

# Activate the plugins
wp plugin update --allow-root --all


# Set Redis-related constants
wp config set WP_CACHE true --raw --allow-root
wp config set WP_REDIS_HOST 'redis' --type=constant --add --allow-root
wp config set WP_REDIS_PORT 6379 --type=constant --add --allow-root

wp config set WP_REDIS_PLUGIN_PATH /var/www/html/wordpress/wp-content/plugins/redis-cache --type=constant --add --allow-root

wp redis enable --allow-root
wp core update --allow-root
wp plugin update --all --allow-root  



exec "$@"