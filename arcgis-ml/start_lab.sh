IMAGE_NAME=${PWD##*/}

docker run \
    -it \
    --rm \
    -p 8888:8888 \
    -v ~/:/home/jovyan/home/ \
    -e JUPYTER_ENABLE_LAB=yes \
    $IMAGE_NAME
    