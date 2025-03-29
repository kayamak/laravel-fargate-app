# docker-laravel 🐳

![License](https://img.shields.io/github/license/ucan-lab/docker-laravel?color=f05340)
![Stars](https://img.shields.io/github/stars/ucan-lab/docker-laravel?color=f05340)
![Issues](https://img.shields.io/github/issues/ucan-lab/docker-laravel?color=f05340)
![Forks](https://img.shields.io/github/forks/ucan-lab/docker-laravel?color=f05340)

## Introduction

Build a simple laravel development environment with docker-compose.

## Usage

```bash
$ git clone git@github.com:kayamak/laravel-fargate-app.git
$ cd laravel-fargate-app
$ make create-project
# 1.5.1 
$ docker-compose exec app composer require 'laravel/breeze:^1.4' --dev
# 1.5.2
$ docker-compose exec app php artisan breeze:install
# 1.5.3
$ docker-compose exec web npm install
 # node を完全に削除
 $ docker-compose exec web apk del nodejs npm
 $ docker-compose exec web rm -rf /usr/local/bin/node /usr/local/lib/node_modules /usr/local/include/node /usr/local/share/man/man1/node.1
 # Alpine Linux (musl) 用の node を再インストール
 $ docker-compose exec web apk add --no-cache nodejs npm
# 1.5.5
$ docker-compose exec web npm run dev
# 2.3.4
$ TFENV_ARCH=amd64 tfenv install 1.0.0
# 2.3.5
$ tfenv list
# 2.3.6
$ tfenv use 1.0.0
$ terraform --version
# 2.4.4
$ export AWS_PROFILE=terraform
$ aws configure list
$ cat ~/.aws/credentials

```

http://localhost

Read this [Makefile](https://github.com/ucan-lab/docker-laravel/blob/master/Makefile).

## Tips

Read this [Wiki](https://github.com/ucan-lab/docker-laravel/wiki).

## Container structure

```bash
├── app
├── web
└── db
```

### app container

- Base image
  - [php](https://hub.docker.com/_/php):8.0-fpm-buster
  - [composer](https://hub.docker.com/_/composer):2.0

### web container

- Base image
  - [nginx](https://hub.docker.com/_/nginx):1.20-alpine
  - [node](https://hub.docker.com/_/node):16-alpine

### db container

- Base image
  - [mysql](https://hub.docker.com/_/mysql):8.0

#### Persistent MySQL Storage

By default, the [named volume](https://docs.docker.com/compose/compose-file/#volumes) is mounted, so MySQL data remains even if the container is destroyed.
If you want to delete MySQL data intentionally, execute the following command.

```bash
$ docker-compose down -v && docker-compose up
```
