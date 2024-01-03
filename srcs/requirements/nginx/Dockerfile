# FROM debian:oldstable-slim

# RUN apt update
# RUN	apt install nginx -y
# RUN apt install vim -y    
# RUN apt install curl -y
# # RUN mkdir -p /etc/nginx/ssl


# RUN apt install openssl -y

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# 	-keyout /etc/ssl/private/nginx-selfsigned.key \
# 	-out /etc/ssl/certs/nginx-selfsigned.crt \
# 	-subj "/C=PT/L=Lisbon/O=42/OU=student/CN=lleiria-.42.fr"
# # RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# # -keyout /etc/nginx/ssl/nginx-selfsigned.key \
# # -out /etc/nginx/ssl/nginx-selfsigned.crt \
# # -subj "/C=PT/L=Lisbon/O=42/OU=student/CN=lleiria-.42.fr"
# # RUN mkdir -p /var/run/nginx

# # COPY conf/nginx.conf /etc/nginx/nginx.conf
# COPY conf/nginx.conf /etc/nginx/conf.d

# # RUN chmod 755 /var/www/html
# # RUN chown -R www-data:www-data /var/www/html

# CMD ["nginx", "-g", "daemon off;"]

FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install nginx && apt-get -y install openssl

RUN mkdir /etc/nginx/ssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/nginx-selfsigned.key \
-out /etc/nginx/ssl/nginx-selfsigned.crt \
-subj "/C=PT/L=Lisbon/O=42/OU=student/CN=lleiria-.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]
