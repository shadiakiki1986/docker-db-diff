#!/bin/sh
set -e

cp /code/exporter/etc/odbc/odbc.ini /etc/
cp /code/exporter/etc/odbc/odbcinst.ini /etc/

cp /code/exporter/etc/cron.d/exporter /etc/cron.d/
chmod g-w /etc/cron.d/exporter
chkcrontab /etc/cron.d/exporter

cp /code/exporter/etc/php/php.ini /usr/local/etc/php/

cd db-diff && composer install && cd -
