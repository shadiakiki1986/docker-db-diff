#!/bin/sh
cp /etc/odbc/odbc.ini /etc
cp /etc/odbc/odbcinst.ini /etc
cd db-diff && composer update
