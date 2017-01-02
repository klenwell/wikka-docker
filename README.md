# Wikka Docker

A Docker image building a LAMP server running version 1.4.0 of [WikkaWiki](https://github.com/wikkawik/WikkaWiki).

The base image is available on Docker Hub:

- https://hub.docker.com/r/klenwell/klenwell-lamp/

This repository is a clone of [Docker LAMPs](https://github.com/klenwell/docker-lamps) and inspired by [dockerWikkaDemo](https://github.com/pepitosoft/dockerWikkaDemo).

**Please note: This image is designed only to be run locally as a development tool. It is not safe for production release.**


## Usage

Clone this repository:

    git clone git@github.com:klenwell/wikka-docker.git
    cd wikka-docker

Build the image:

    docker build -t wikka-1.4.0 .

Run the image as a container (binding the webserver to localhost port 5080):

    docker run -d -p 5080:80 -p 5306:3306 wikka-1.4.0

Note: it will take a minute or so for the webserver to be ready.

Test your deployment:

	curl http://localhost:5080/

Access running container:

    docker ps
    docker exec -it <CONTAINER ID> /bin/bash


## Wikka Application

The wikka application will be set up to be installed with the following database:

- Database Name: `wikka`
- Database User: `wikka`
- Database Password: `wikka-password`
