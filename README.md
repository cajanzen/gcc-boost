# Usage

The following command Mounts the home directory in the container and switches UID and GID to match the current user"

````bash
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
````
