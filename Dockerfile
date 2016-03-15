FROM php:5.6-apache
MAINTAINER Coordenadoria de Tecnologia da Informação <ccti@quixada.ufc.br>

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get -y install mysql-client pwgen python-setuptools curl git unzip apache2 libapache2-mod-php5 \ 
	postfix wget supervisor curl libcurl3	libcurl3-dev git-core
	&& docker-php-ext-install gd pgsql curl xmlrpc intl mysql
	
VOLUME /var/moodledata
VOLUME /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
	
	
