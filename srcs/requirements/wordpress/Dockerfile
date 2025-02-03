FROM	debian:bullseye

RUN	apt-get update -y && apt-get upgrade -y
RUN	apt-get install -y wget \
	php7.4 php-fpm php-mysql php-common php-cgi php-cli mariadb-client

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

RUN	wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
RUN	tar -xzf /var/www/wordpress-6.2.2-fr_FR.tar.gz -C /var/www/.
RUN	cp -r /var/www/wordpress/. /var/www/html
RUN	rm /var/www/wordpress-6.2.2-fr_FR.tar.gz

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN 	chmod +x wp-cli.phar

EXPOSE	9000

COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY 	tools/config_wp.sh config_wp.sh

RUN	chmod +x config_wp.sh

CMD ["./config_wp.sh"]

