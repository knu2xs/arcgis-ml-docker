for %%a in ("%cd%") do set IMAGE_NAME=%%~na

docker build --no-cache -t %IMAGE_NAME% .