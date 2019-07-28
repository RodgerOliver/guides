# Docker

## Install

`sudo apt install docker docker.io`

## Basics

`docker ps`

List containers.

`docker images`

List images.

`docker -i -t ubuntu:19.10 /bin/bash`

Install Ubuntu 19.10 image and run the container.

`Ctrl + PQ`

Put docker in background.

`Ctrl + D`

Logout from the current docker container.

`docker attach [container id]`

Attach to a container.

`docker diff [container id]`

Diff changes since container was created.

`docker stop [container id]`

Stop container.

`docker run -i -t -p 8080:80 ubuntu:19.10 /bin/bash`

Create a container and link the port 8080 of the host to the port 80 of the container.

`/etc/init.d/nginx start`

Start a webserver on the container.

`docker commit [container id] pk/ubuntu:1.0`

Commit (create) an image to save the changes made to it.
