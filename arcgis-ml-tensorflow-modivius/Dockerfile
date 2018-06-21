FROM jupyter/tensorflow-notebook AS build

# install packages and update the system
USER root
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y \
    build-essential \
    git \
    lsb-release \
    sudo \
    udev \
    usbutils \
    wget
RUN apt-get clean all
USER jovyan

# Install Conda packages
RUN conda install -y \
    unzip \
    pandas \
    lxml \
    html5lib \
    beautifulsoup4 \
    matplotlib \
    pillow \
    bokeh \
    numpy \
    seaborn \
    scikit-image \
    scikit-learn \
    pysal \
    pyshp \
    keyring

RUN conda install -y -c conda-forge \
    shapely \
    jupyterlab

RUN conda install -y -c esri arcgis

RUN conda clean -y -a

# add jovyan user to sudo group with no password requirement so build scripts will work
USER root
# RUN usermod -aG sudo jovyan
# RUN sed -i '$ a\jovyan ALL=(ALL) NOPASSWD: ALL' /etc/sudoers


# download, build, and install Modivius SDK
RUN git clone -b ncsdk2 http://github.com/Movidius/ncsdk
WORKDIR /home/jovyan/ncsdk
RUN make install
USER jovyan

# # build examples
# RUN make examples

WORKDIR /home/jovyan