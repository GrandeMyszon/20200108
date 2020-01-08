#list all volumes
docker volume ls

#execute docker to create the file in the folder, which is mapped to a volume
docker exec devtest touch /app/cloudstatelist

#run two containers with mapped volume, two different containers are accessing same volume
docker run -it --name myal02 --mount source=myvol2,target=/app alpine:latest sh
docker run -it --name myub03 --mount source=myvol2,target=/app ubuntu:latest bash

#run a container with bind mount to local folder
docker run -it --mount type=bind,source=/Users/mifurm/dockermount,target=/app alpine sh

#create two containers with mounted volume
docker run -it --name csmount03 --mount type=volume,source=myvol2,target=/app alpine sh
docker run -it --name csmount04 --mount type=volume,source=myvol2,target=/app alpine sh

