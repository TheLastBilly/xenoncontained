# Building the image

Whenever you build the image, just make sure that you're using the right name and tags for it. You can do so by using the included **docker-compose.yml** file with the following command:

```bash
$ docker-compose build
```

## The image size is over 1.6 GB?!

That's because the image does not only have the data inside the container, but it also keeps a history of its previous iterations (as far as I know, I could be wrong tho). Anyways, in order to "fix" that, just export the image and import it again. If you want to get the **[container id]** just login into your container and extract it from the shell:

```
libxenon@22fdb38dc640:~$
         ^^^^^^^^^^^^
         Here's the ID
```

Once you get it, just run the following commands and you should be good to go

```bash
$ docker export [container id] > my_image.tar.gz
$ cat my_image.tar.gz | docker import - thelastbilly/libxenon:latest
$ rm my_image.tar.gz
```


