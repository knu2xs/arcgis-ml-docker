# Docker Image Templates

Getting an environemnt configured to work with machine learning and the Python API requires getting _quite a bit of configuration_ to get set up and running. An additional consideration is many of the features of the Python API supporting machine learning, notably the SpatialDataFrame, are under active development. As a result, it can be advantagous to also have access to an environemnt with the latest daily build to test against as well.

## Current Status 07Jun2018

In support of current initiatives and resources we are using for machine learning, there are currently three images set up with a standard structure including a Dockerfile defining the build and associated resources to make building and running the image locally much easier.

## Images

### ArcGIS-ML

- Base Image - [jupyter/scipy-notebook](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook)
- ArcGIS Python API - Current Stable Build

This is the main image combining Jupyter's SciPy Notebook Docker container with the ArcGIS Python API, but not including packages supporting deep nerual networks. Notably it does not include TensorFlow and Keras.

### ArcGIS-ML-Dev

- Base Image - [jupyter/scipy-notebook](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook)
- ArcGIS Python API - Current Daily Build

_Building this image requires being on the Esri network, either in an office location, or connected through VPN._

The SpatialDataFrame is likely the most powerful object in the Python API supporting machine learning. It also is rather young. Our forays into combining the worlds of Esri and machine learning using the SpatialDataFrame pushes this new technology really hard, and in the process, exposes vulnerabilities, shortcomings, and bugs. Fortunately, the team working on the Python API is very receptive to feedback. Hence, when working with the Python API in conjunction with machine learning, and encountering issues, it is extremely beneficial to also be able to test against the current daily builds to see if the issue has been addressed. As a result, this image enables quickly building an identical environemnt to the ArcGIS-ML image, but with the current daily build.

### ArcGIS-ML-PySpark

- Base Image - [jupyter/pyspark-notebook](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-pyspark-notebook)
- ArcGIS Python API - Current Stable Build

This image combines Jupyter's PySpark Notebook Docker container with the ArcGIS Python API. This base image includes everything from the SciPy container, along with Spark with PySpark. Then it adds the ArcGIS Python API.

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
- `build.sh` - builds the image and adds it to the local machine
- `start.sh` - starts the image with normal Jupyter Notebook
- `start_lab.sh` - starts the image with Jupyter Lab
- `start_lab_sudo.sh` - starts the image with Jupyter Lab with superuser privilages