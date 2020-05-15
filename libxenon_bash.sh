#!/bin/bash
docker run -ti -v "$(pwd):/mnt/share:" thelastbilly/libxenon:latest /bin/sh -c 'cd /mnt/share && bash'
