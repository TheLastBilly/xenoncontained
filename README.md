# Libxenon Contained

This is a docker image that I built to help me set up a working development enviroment for [libxenon](https://github.com/Free60Project/libxenon), a library used to write homebrew applications for the Xbox 360.

## Why Docker? 

I could have made a VM image instead, but a docker image is a bit more flexible and easy to move around, it also requires less work to get it working. And yes, I know Docker was not designed for this kind of stuff, but I'm not the first one to come up with the concept, and the image has worked quite well for me so far, so I'd say it's good enough.

The only issue I have with the current image however, is it's size, but that is something I imagine I'll be able to get around at some point in the future. And of course, if you'd like to contribute in any way, please do, I welcome any contributions to the project. 

## Usage

You'll first have to pull the image from docker hub. You can do so by typing the following command into your terminal
```bash
$ docker pull thelastbilly/libxenon:latest
```

You can now open a shell in your current directory by either using the **libxenon_bash.sh** script on the root of this directory, or by using the following command:
```bash
$ docker run -ti -v "[Your Current Directory]:/mnt/share:rw" thelastbilly/libxenon:latest /bin/sh -c 'su - libxenon'
```

You can also create an alias for the command in your terminal. The process is rather simple to do for most shells:

### Bash
Copy the following line at the end of **~/.bashrc**:
```vim
alias libxenon_bash="docker run -ti -v $(pwd):/mnt/share:rw thelastbilly/libxenon:latest /bin/sh -c 'su - libxenon'"
```

Then apply the changes to your current shell.
```bash
$ source ~/.bashrc
```
 
That's it!, you can now use the `libxenon_bash` command to launch the bash shell on your libxenon enviroment.
