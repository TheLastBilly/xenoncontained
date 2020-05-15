#!/bin/bash
docker run -ti -v "$(pwd):/mnt/share:" thelastbilly/libxenon:latest /bin/sh -c 'su - libxenon'
