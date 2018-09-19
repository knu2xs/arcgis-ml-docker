# Docker Image Templates

Getting an environemnt configured to work with machine learning and the Python API requires some fiddling to get set up and running. Further, depending on what you are attempting to do, it is desireable to get a few other complimentary capabilities set up as well - possibly Spark and PySpark or TensorFlow and Keras. Instead of wresting to get these set up every time, I created a few Dockerfiles with supporting build scripts to streamline this process for myself between my Mac and my Windows machines. The Dockerfiles used for building these images are not very complex. They build on the excellent images provided by Jupyter.

## Prerequsites

### Docker
Before getting started, please ensure you have [Docker]((https://store.docker.com/search?type=edition&offering=community)) installed on your machine. Once installed, if you are on a Windows machine, please ensure you also set the Docker network interface as private for file sharing to work as expected.

### Enable Networking (_Windows Only_)
The PowerShell command to switch the Docker network interface to private is included in the file, `dockerNatPrivate.ps1`. It contains a single command you can simply run by copying and pasting into a PowerShell session being run as an Administrator as well...

`Set-NetConnectionProfile -interfacealias "vEthernet (DockerNAT)" -NetworkCategory Private`

## Images

### ArcGIS-ML

- Base Image - [jupyter/scipy-notebook](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook)
- ArcGIS Python API - Current Stable Build

This is the main image combining Jupyter's SciPy Notebook Docker container with the ArcGIS Python API, but not including packages supporting deep nerual networks. Notably it does not include TensorFlow and Keras.

### ArcGIS-ML-Dev

- Base Image - [jupyter/scipy-notebook](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook)
- ArcGIS Python API - Current Daily Build

_Building this image requires being on the Esri network, which means you also have to be an employee of Esri in an office location, or connected through VPN._

The Spatialy Enabled DataFrame (SEDF) is likely most useful object in the Python API for data science and machine learning. It also is rather young. Frequently, my forays into combining the worlds of Esri and machine learning using the SEDF pushes this new technology really hard, and in the process exposes vulnerabilities. Fortunately, the team working on the Python API is very receptive to feedback and pull requests. Hence, when working with the Python API in conjunction with machine learning, and encountering issues, it is extremely beneficial to also be able to test against the current daily builds to see if the issue has been addressed. As a result, this image enables quickly building an identical environemnt to the ArcGIS-ML image, but with the current daily build.

### ArcGIS-ML-PySpark

- Base Image - [jupyter/pyspark-notebook](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-pyspark-notebook)
- ArcGIS Python API - Current Stable Build

This image combines Jupyter's PySpark Notebook Docker container with the ArcGIS Python API. This base image includes everything from the SciPy image, along with Spark with PySpark. Then it adds the ArcGIS Python API.

### ArcGIS-ML-SOM

- Base Image - [jupyter/scipy-notebook](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook)
- ArcGIS Python API - Current Stable Build
- [SOMPY](https://github.com/sevamoo/SOMPY)

A few demonstrations we have created require the SOMPY package to support self-orgainzed mapping machine learning workflows. Getting this set up, while not outrageously difficult, is also not very intuitive, either. Hence, this image makes it much easier to have a working envornment to support these demonstrations.

### ArcGIS-ML-TensorFlow

- Base Image - [jupyter/tensorflow-notebook](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-tensorflow-notebook)
- ArcGIS Python API - Current Stable Build

This image combines Jupyter's TensorFlow Notebook Docker container with the ArcGIS Python API. This base image includes everything from the SciPy container, along with TensorFlow and Keras. Then it adds the ArcGIS Python API.

## Supporting Files in Each Image Directory

These files make it a little easier to execute build and run commands with standard options. If you want an image available on your machine, run the build file, and then start the image using either the `start` to run Jupyter Notebook or `start_lab` to run Jupyter Lab (my preference). Since commands are different, I have included files supporting *nix commands with the extension `.sh`, and files supporting Windows with the extension `.bat`. Simply run the correct file for your platform.

- `build` - builds the image and adds it to the local machine
- `start` - starts the image with normal Jupyter Notebook
- `start_lab` - starts the image with Jupyter Lab
- `start_lab_sudo` - starts the image with Jupyter Lab with superuser privilages (I've only set these up with 

### Local File Access

Each of the start files is configured to map the directory you will see named home in either Jupyter Notebook or Jupyter Lab to your home directory on your local machine. This enables you to persist your work between sessions. Any files saved in the filesystem of the Docker container will be lost when the Docker image is stopped. This works out of the box on any *nix operating system, but requires ensuring the network interface for Docker is set to _private_ on Windows.

If on a Windows machine, if you have not already followed the prerequsite setup instructiosn above, you will need to run the command contained in the included PowerShell file, `dockerNatPrivate.ps1`. It contains a single command you can simply run by copying and pasting into a PowerShell session being run as an Administrator as well...

`Set-NetConnectionProfile -interfacealias "vEthernet (DockerNAT)" -NetworkCategory Private`

You can add or remove mapped locations by modifying the start file you are using. For instance, by default, the command being run to start Jupyer Labs is...

- *nix - `docker run -it --rm -p 8888:8888 -v ~/:/home/jovyan/home/ -e JUPYTER_ENABLE_LAB=yes arcgis-ml`
- Windows - `docker run -it --rm -p 8888:8888 -v %USERPROFILE%:/home/jovyan/home/ -e JUPYTER_ENABLE_LAB=yes arcgis-ml`

If you are not familiar with the command line, the minimum to get an image running is really little more than...

`docker run arcgis-ml`

This tells docker to run the image named `arcgis-ml`. For it to do a few more things we want for efficiency's sake, we add parameters telling docker how to run our image. This is all the other stuff. The part enabling local file access to your home directory is...

- *nix - `-v ~/:/home/jovyan/home/`
- Windows - `-v %USERPROFILE%:/home/jovyan/home/`

If you want to change this location, the syntax is `local_path:remote_path`. For instance, on one machine I work on, a Windows machine, most of my stuff is located in `E:\dev`. Hence, for this to show up as `dev` in the Jupyter Notebook session I modify the `run` command to look like this...

- `docker run -it --rm -p 8888:8888 -v E:/dev:/home/jovyan/dev/ -e JUPYTER_ENABLE_LAB=yes arcgis-ml`

# Licensing - The MIT License

Copyright 2018 Joel McCune

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
