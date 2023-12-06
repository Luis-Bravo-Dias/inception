FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt update -y
RUN apt upgrade -y

RUN apt-get -y install wget

RUN apt install -y curl php-fpm php-mysql php-curl php-gd php-mbstring php-xml \
	php-xmlrpc php-soap php-intl php-zip mariadb-client

# RUN apt-get install -y php7.3\
# php-fpm\
# php-mysql\
# mariadb-client

RUN apt install curl-y

RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz
RUN chown -R root:root /var/www/wordpress