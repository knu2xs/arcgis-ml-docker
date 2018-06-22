for %%a in ("%cd%") do set IMAGE_NAME=%%~na

docker build -t %IMAGE_NAME% .