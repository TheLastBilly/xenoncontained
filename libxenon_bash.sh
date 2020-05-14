#!/bin/bash
docker run -ti -v "$(pwd):/mnt/share:" thelastbilly/libxenon:20.04 /bin/sh -c 'cd /mnt/share && bash'
