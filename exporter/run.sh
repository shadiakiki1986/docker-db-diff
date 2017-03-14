#!/bin/sh
# Runner script to do the exports and emails

# Cannot have "set -e" because a "data not changed exception" happens
# set -e

echo "start"

PHPBIN=/usr/local/bin/php

echo "export      MarketflowAcc   Marketflow..TITRE  TIT_COD"
$PHPBIN /code/exporter/db-diff/bin/pdo-git export      MarketflowAcc   Marketflow..TITRE  TIT_COD

echo "post-commit MarketflowAcc   Marketflow..TITRE ..."
$PHPBIN /code/exporter/db-diff/bin/pdo-git post-commit \
  MarketflowAcc   Marketflow..TITRE  \
  --columns /code/exporter/db-diff/src/columns/ffa-titre.yml \
  --format email \
  --email.to s.akiki@ffaprivatebank.com \
  --email.subject "* New securities diff - LB - `date +%Y-%m-%d`" \
  --email.config /code/exporter/etc/swiftmailer/ffa.yml

echo "export      MarketflowAccDB MkfFFADubai..TITRE TIT_COD"
$PHPBIN /code/exporter/db-diff/bin/pdo-git export      MarketflowAccDB MkfFFADubai..TITRE TIT_COD

echo "post-commit MarketflowAccDB MkfFFADubai..TITRE ..."
$PHPBIN /code/exporter/db-diff/bin/pdo-git post-commit \
  MarketflowAccDB MkfFFADubai..TITRE \
  --columns /code/exporter/db-diff/src/columns/ffa-titre.yml \
  --format email \
  --email.to s.akiki@ffaprivatebank.com \
  --email.subject "* New securities diff - AE - `date +%Y-%m-%d`" \
  --email.config /code/exporter/etc/swiftmailer/ffa.yml

echo "end"
