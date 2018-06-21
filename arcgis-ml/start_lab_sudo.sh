IMAGE_NAME=${PWD##*/}

docker run \
    -it \
    --rm \
    -e GRANT_SUDO=yes \
    -v ~/:/home/jovyan/home/ \
    $IMAGE_NAME
    start.sh jupyter lab