FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
RUN mysql_install_db

COPY ./tools/script.sh /home/

RUN chmod +x /home/script.sh

EXPOSE 3306

ENTRYPOINT [ "/home/script.sh" ]