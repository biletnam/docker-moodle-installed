FROM php:5.6-apache
MAINTAINER Coordenadoria de Tecnologia da Informação - Quixada <ccti@quixada.ufc.br>

RUN apt-get update && \
	apt-get -y install mysql-client pwgen python-setuptools curl git unzip libapache2-mod-php5 \ 
	postfix wget supervisor curl libcurl3 libcurl3-dev git-core \
	&& docker-php-ext-install gd pgsql curl xmlrpc intl mysql
	
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
