FROM debian:oldstable-slim

# RUN apt-get -y update
# RUN apt-get -y upgrade
RUN apt update -y
RUN apt upgrade -y

# RUN apt-get -y install wget

RUN apt install -y curl php-fpm php-mysql php-curl php-gd php-mbstring php-xml \
	php-xmlrpc php-soap php-intl php-zip mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /run/php/ && chmod 755 /run/php/

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 9000#g' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/script.sh /home/

RUN chmod +x /home/script.sh

EXPOSE 9000

ENTRYPOINT [ "/home/script.sh" ]

CMD [ "php-fpm7.4", "-F", "-R" ]