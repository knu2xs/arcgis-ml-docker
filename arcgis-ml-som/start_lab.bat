for %%a in ("%cd%") do set IMAGE_NAME=%%~na

docker run -it --rm -p 8888:8888 -v %USERPROFILE%:/home/jovyan/home/ -e JUPYTER_ENABLE_LAB=yes %IMAGE_NAME%