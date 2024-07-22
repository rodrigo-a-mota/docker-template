FROM mysql/mysql-server
LABEL authors="Rodrigo Mota"

ARG ROOT_PASSWORD=example=37
ENV MYSQL_ROOT_PASSWORD=${ROOT_PASSWORD}

ARG SETUP_DATABASE=dbteste
ENV MYSQL_DATABASE=${SETUP_DATABASE}

ARG MYSQL_USER=usexample
ARG MYSQL_PASSWORD=example=37

RUN echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;" > /docker-entrypoint-initdb.d/_grant_remote.sql

EXPOSE 3306
CMD ["mysqld"]