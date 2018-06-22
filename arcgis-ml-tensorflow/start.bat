for %%a in ("%cd%") do set IMAGE_NAME=%%~na

docker run \
    -it \
    --rm \
    -p 8888:8888 \
    -v ~/:/home/jovyan/home/ \
    %IMAGE_NAME%
