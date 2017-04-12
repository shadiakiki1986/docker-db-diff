# docker-db-diff
Workflow using [db-diff](https://github.com/shadiakiki1986/db-diff)

To save database data to git repository and display differences in email/ui

## Architecture
Similar to [ffa-zkteco-mfbf](https://github.com/shadiakiki1986/ffa-zkteco-mfbf/)

## Testing
Check [db-diff](https://github.com/shadiakiki1986/db-diff)

## Usage
1. Copy your own odbc files into `exporter/etc/odbc/`
2. Copy your own `swiftmailer.yml` file into `exporter/etc/swiftmailer`
3. `docker-compose up`

If https://healthchecks.io/ is desired to be used, add `docker-compose.override.yml`
with an environment variable `HC_URL` for `exporter` set to the endpoint from there

## Dev notes
To run in dev mode, `docker-compose up -f docker-compose.yml -f docker-compose.dev.yml`
