FROM shadiakiki1986/php7-apache-odbc-and-other
RUN  apt-get update \
  && apt-get install cron
WORKDIR /code/exporter
RUN composer create-project shadiakiki1986/db-diff
ENTRYPOINT entry.sh \
        && cron -f
