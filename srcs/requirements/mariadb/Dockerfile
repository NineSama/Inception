FROM	debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/autoconfig.sh ./
RUN chmod 755 ./autoconfig.sh

CMD		["./autoconfig.sh"]
