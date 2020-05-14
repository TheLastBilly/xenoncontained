# Building the image

Whenever you build the image, just make sure that you're using the right name and tags for it. You can do so by using the included **docker-compose.yml** file with the following command:

```bash
$ docker-compose build
```

## The image size is over 1.6 GB?!

Yeah, I don't know why it does that yet. You can decrease the size to approx. 700 MB by login into the container and deleting the **/libxenon** directory:

```
$ docker run -ti thelastbilly/libxenon /bin/bash
root@[container id]# rm -rf /libxenon
root@[container id]# exit
```

Now you can export the container using the ***[container id]*** located in the container's shell prompt, and then load it into your docker images. You should also delete your previous image to avoid issues.

```bash
$ docker image rm -f thelastbilly/libxenon:latest
$ docker export [container id] > my_image.tar.gz
$ cat my_image.tar.gz | docker import - thelastbilly/libxenon:latest
```


