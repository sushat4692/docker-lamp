# My local environment for small projects in one docker

## Structure

* php:7.3-apache
  * Installed pdo, mysqli, gd, composer etc...
  * Configurred VirtualDocumentRoot (Please see the following instruction)
* adminer
* ~~mysql:5.6~~ -> mariadb:10.5.10
* maildev/maildev
  * With iconv (Support ISO-2022-JP)
  * [Refered this post, thanks](https://qiita.com/kanemu/items/1f2da063c7e5b5477502)

## VirtualDocumentRoot

You can configure Virtual directory in .env `WEB_SERVER_DIR`.

If you setup `~/Virtual`, you can access by the following.

```
Local env                 In Virtual env               URL
~/Virtual/foo/htdocs  ->  /Virtual/www/foo/htdocs  ->  http://foo.localhost:8000/
~/Virtual/bar/htdocs  ->  /Virtual/www/bar/htdocs  ->  http://bar.localhost:8000/
```