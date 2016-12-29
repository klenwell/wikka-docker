# Docker LAMPs

A collection of Docker LAMP images. Different options are organized by branch. The base image was based on the following repositories:

- https://github.com/webmaestro365/lamp7xenial
- https://github.com/tutumcloud/lamp


## Usage

Clone this repository:

    git clone git@github.com:klenwell/docker-lamps.git
    cd docker-lamps

Build the image:

    docker build -t klenwell-lamp .

Run the image as a container (binding the webserver to localhost port 5080):

    docker run -d -p 5080:80 -p 5306:3306 klenwell-lamp

Test your deployment:

	curl http://localhost/

Access running container:

    docker ps
    docker exec -it <CONTAINER ID> /bin/bash


## Docker Installation (Ubuntu)

First, update apt and install necessary Ubuntu packages:

- https://docs.docker.com/engine/installation/linux/ubuntulinux/

Then install using apt:

- https://docs.docker.com/engine/installation/linux/ubuntulinux/#/install-the-latest-version

```
# Install
sudo apt-get install docker-engine

# Start and test
sudo service docker start
sudo docker run hello-world
```

Configure to run as non-root user:

- https://docs.docker.com/engine/installation/linux/ubuntulinux/#/manage-docker-as-a-non-root-user

```
sudo groupadd docker
sudo usermod -aG docker $USER
# log out and log in
docker run hello-world
```
