# My local environment for small projects in one docker

## Structure

- php:(5.6, 7.3, 7.4, 8.0, 8.1 and 8.2)-apache
  - Installed pdo, mysqli, gd, composer etc...
  - Configurred VirtualDocumentRoot (Please see the following instruction)
- adminer
- mariadb:10.5.10
- axllent/mailpit:v1.6

## Commands

You can use `command.sh` to control containers.

```bash
# Up (Build and Start) containers
$ ./command.sh up
# Start containers
$ ./command.sh start
# Stop containers
$ ./command.sh stop
# Delete containers, images and volumes
$ ./command.sh delete
```

## How to change PHP version

`command.sh` has an argument to change PHP version.

```bash
# e.g. php5.6
$ ./command.sh up 56
# or `start`
$ ./command.sh start 56

# e.g. php8.1
$ ./command.sh up 81
# or `start`
$ ./command.sh start 81
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
