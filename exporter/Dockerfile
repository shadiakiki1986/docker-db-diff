FROM shadiakiki1986/php7-apache-odbc-and-other
RUN echo "Acquire::http::Proxy \"http://pmo.ffaprivatebank.com:3142\";" | tee /etc/apt/apt.conf.d/01proxy
RUN  apt-get -qq    update \
  && DEBIAN_FRONTEND=noninteractive \
       apt-get -qq -y install cron

# copied from ffa-zkteco-mfbf/copier
RUN cd /usr/src/php/ext/pdo_odbc \
 && phpize \
 && ./configure --with-pdo-odbc=unixODBC,/usr > /dev/null \
 && docker-php-ext-install pdo_odbc > /dev/null

WORKDIR /code/exporter
RUN composer create-project shadiakiki1986/db-diff
RUN  apt-get -qq    update \
  && DEBIAN_FRONTEND=noninteractive \
       apt-get -qq -y install rsyslog
COPY . .
ENTRYPOINT /bin/sh entry.sh \
        && service rsyslog start \
        && service cron start \
        && tail -f /var/log/syslog
