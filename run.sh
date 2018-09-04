#!/usr/bin/env bash
echo "Mounting home directory in container and switching UID and GID to match the current user"
docker run \
  --rm \
  -e GID=`id -g` \
  -e GROUP=`id -gn` \
  -e HOME=$HOME \
  -e UID=`id -u` \
  -e USER=$USER \
  -it \
  -u `id -u`:`id -g` \
  -v $HOME:$HOME \
  -w $HOME \
  $USER/gcc bash
echo "Exited from container"
