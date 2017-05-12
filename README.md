# Docker SHOREmap
This repository contains the Dockerfile for creating an image with the [SHOREmap](http://shoremap.org) software preinstalled.
This enables easy cross-platform usage of the SHOREmap package without complicated installation procedure.

First you will need to [install Docker](https://www.docker.com/community-edition#/download).
Then load the docker container by running the following command in the terminal:

```
docker run -it -v /your/files:/data danielwells/shoremap
```
Replace "/your/files" with the path to the folder on your machine containing files you want to be accessible inside the container.
NB: If you delete or modify a file in /data within the container it will also be modified on your computer!

Once the container has loaded you can run SHOREmap like so:
```
SHOREmap about
```