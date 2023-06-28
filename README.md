# My local environment for small projects in one docker

## Structure

- php:(5.6, 7.3, 7.4, 8.0 and 8.1)-apache
  - Installed pdo, mysqli, gd, composer etc...
  - Configurred VirtualDocumentRoot (Please see the following instruction)
- adminer
- mariadb:10.5.10
- axllent/mailpit:v1.6

## How to change PHP version

You can change PHP version depends on starting command.

```bash
# e.g. php5.6
$ docker compose -f docker-compose.yml -f docker-compose.php56.yml up
# or `start`
$ docker compose -f docker-compose.yml -f docker-compose.php56.yml start

# e.g. php8.1
$ docker compose -f docker-compose.yml -f docker-compose.php81.yml up
# or `start`
$ docker compose -f docker-compose.yml -f docker-compose.php81.yml start
```

## VirtualDocumentRoot

You can configure Virtual directory in .env `WEB_SERVER_DIR`.

If you setup `~/Virtual`, you can access by the following.

```
Local env                 In Virtual env               URL
~/Virtual/foo/htdocs  ->  /Virtual/www/foo/htdocs  ->  http://foo.localhost/
~/Virtual/bar/htdocs  ->  /Virtual/www/bar/htdocs  ->  http://bar.localhost/
```

## Dummy SMTP Server

You can check email from develop environment by the following url.

- http://localhost:{MAILPIT_SERVER_FRONT_PORT}/
  - `.env.sample` value is 8025
  - http://localhost:8025/

If you need to input SMTP information to the system.

- HOST
  - develop-mailpit
- PORT
  - 1025

## Remarks

### How to copy SQL File from Host to Adminer container for importing

```bash
docker compose cp adminer.sql develop-adminer:/var/www/html/adminer.sql
```
