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

## Dev notes
To run in dev mode, `docker-compose up -f docker-compose.yml -f docker-compose.dev.yml`
