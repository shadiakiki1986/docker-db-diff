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

RUN  apt-get -qq    update \
  && DEBIAN_FRONTEND=noninteractive \
       apt-get -qq -y install rsyslog

RUN apt-get -qq update > /dev/null \
 && DEBIAN_FRONTEND=noninteractive \
      apt-get -qq -y install python-pip > /dev/null
# chkcrontab
# https://code.google.com/archive/p/chkcrontab/wikis/CheckCrontab.wiki
#
# Can go back to `pip install chkcrontab` once the following PR is merged
# https://github.com/lyda/chkcrontab/pull/20
RUN pip install git+https://github.com/shadiakiki1986/chkcrontab.git@check_permissions

# envsubst for cron
RUN  apt-get -qq    update \
  && DEBIAN_FRONTEND=noninteractive \
       apt-get -qq -y install gettext

WORKDIR /code/exporter
COPY . .
ENTRYPOINT /bin/sh entry.sh \
        && service rsyslog start \
        && service cron start \
        && tail -f /var/log/syslog
