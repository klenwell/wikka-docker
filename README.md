# Docker LAMPs: Wikka 1.4.0

A Docker image building a LAMP server running version 1.4.0 of [WikkaWiki](https://github.com/wikkawik/WikkaWiki).

The base image is available on Docker Hub:

- https://hub.docker.com/r/klenwell/klenwell-lamp/

**Please note: This image is designed only to be run locally as a development tool. It is not safe for production release.**


## Usage

Clone this repository:

    git clone git@github.com:klenwell/docker-lamps.git
    cd docker-lamps
    git checkout wikka-1.4.0

Build the image:

    docker build -t wikka-1.4.0 .

Run the image as a container (binding the webserver to localhost port 5080):

    docker run -d -p 5080:80 -p 5306:3306 wikka-1.4.0

Test your deployment:

	curl http://localhost:5080/

Access running container:

    docker ps
    docker exec -it <CONTAINER ID> /bin/bash
