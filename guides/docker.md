# Docker

## Install

`sudo apt install docker docker.io`

## Basics

`docker ps`

List containers.

`docker images`

List images.

`sudo docker rmi ubuntu:19.10`

Remove images.

`docker run -ti [image]:[version] [process]`
`docker run -i -t ubuntu:19.10 /bin/bash`

Install Ubuntu 19.10 image and run the container.

`docker create ubuntu`

Create a container with an image.

`Ctrl + PQ`

Put docker in background.

`Ctrl + D`

Logout from the current docker container.

`docker attach [container id]`

Attach to a container.

`docker diff [container id]`

Diff changes since container was created.

`docker [start|pause|unpause|stop] [container id]`

Start, pause or stop a container.

`docker [stats|top] [container id]`

Info about the container.

`docker rm [container id]`

Remove container.

`docker run -i -t -p 8080:80 ubuntu:19.10 /bin/bash`

Create a container and link the port 8080 of the host to the port 80 of the container.

`/etc/init.d/nginx start`

Start a webserver on the container.

`docker commit [container id] pk/ubuntu:1.0`

Commit (create) an image to save the changes made to it.

`docker cp [container id]:/file/path/within/container /host/path/target`
