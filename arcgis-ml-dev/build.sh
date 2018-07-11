IMAGE_NAME=${PWD##*/}

docker build --no-cache -t $IMAGE_NAME .