FROM shadiakiki1986/php7-apache-odbc-and-other
RUN echo "Acquire::http::Proxy \"http://pmo.ffaprivatebank.com:3142\";" | tee /etc/apt/apt.conf.d/01proxy
RUN  apt-get -qq    update \
  && DEBIAN_FRONTEND=noninteractive \
       apt-get -qq -y install cron
WORKDIR /code/exporter
RUN composer create-project shadiakiki1986/db-diff
ENTRYPOINT entry.sh \
        && cron -f
