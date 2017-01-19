#!/bin/sh
set -e

cp /code/exporter/etc/odbc/odbc.ini /etc/
cp /code/exporter/etc/odbc/odbcinst.ini /etc/
cp /code/exporter/etc/cron.d/exporter /etc/cron.d/
cp /code/exporter/etc/php/php.ini /usr/local/etc/php/

cd db-diff && git pull && composer update
