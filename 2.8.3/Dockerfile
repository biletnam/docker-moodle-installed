FROM php:5.6-apache

MAINTAINER Coordenadoria de Tecnologia da Informação - Quixada <ccti@quixada.ufc.br>

RUN apt-get update && \
	apt-get -y install libpng12-dev libjpeg-dev zip unzip \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-configure xmlrp --with-libxml-dir=/usr \
	&& docker-php-ext-install gd xmlrpc intl mysqli
	
# set recommended PHP.ini settings
# see https://docs.moodle.org/28/en/Installing_Moodle_on_Debian_based_distributions
RUN { \
		echo 'memory_limit = 40M'; \
		echo 'post_max_size = 80M'; \
		echo 'upload_max_filesize = 80M'; \
	} > /usr/local/etc/php/conf.d/moodle-recommended.ini
	
ADD crontab /etc/cron.d/moodle-cron
RUN chmod 0644 /etc/cron.d/moodle-cron
RUN chown www-data: /etc/cron.d/moodle-cron
RUN touch /var/log/cron.log
	
VOLUME /var/www/moodledata
VOLUME /var/www/html

CMD ["apache2-foreground"]
