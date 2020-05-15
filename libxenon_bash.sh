#!/bin/bash
docker run -ti -v "$(pwd):/mnt/share:" thelastbilly/libxenon:buster /bin/sh -c 'cd /mnt/share && bash'
