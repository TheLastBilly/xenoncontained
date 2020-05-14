# Building the image

Whenever you build the image, just make sure that you're using the right name and tags for it. You can make sure of it by using the included **docker-compose.yml** with the following command:

```bash
$ docker-compose build
```

## The image mage size is over 1.6 GB?!

Yeah, I don't know why it does that yet. You can decrease the size of approx. 700 MB by login into the container and deleting **/libxenon**:

```
$ docker run -ti thelastbilly/libxenon /bin/bash
root@[container id]# rm -rf /libxenon
root@[container id]# exit
```

Now you can export the container using the id listed in the shell, and then load it into your images

```bash
$ docker image rm -f thelastbilly/libxenon:latest
$ docker export [container id] > my_image.tar.gz
$ cat my_image.tar.gz | docker import - thelastbilly/libxenon:latest
```


