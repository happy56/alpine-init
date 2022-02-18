#!/bin/sh
apk update && apk upgrade 
apk add git 
git clone https://github.com/happy56/alpine-init
cd alpine-init/init-server
chmod +x server-0-1.sh
./server-0-1.sh