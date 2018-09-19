FROM jupyter/scipy-notebook AS build

# add conda-forge and esri to list of channels
RUN conda config --prepend channels esri
RUN conda config --prepend channels conda-forge

# ensure most recent version of Conda is installed
RUN conda update -n base conda

# update all outdated packages
RUN conda update --all

# Install new packages
RUN conda install -y \
    arcgis \
    beautifulsoup4 \
    bokeh \
    fiona \
    geopandas \
    html5lib \
    inflection \
    jupyterlab \
    keyring \
    libgdal \
    lxml \
    matplotlib \
    ncurses \
    numpy \
    pandas \
    pillow \
    pysal \
    pyshp \
    rtree \
    scikit-image \
    scikit-learn \
    seaborn \
    shapely \
    unzip

RUN git clone https://github.com/sevamoo/SOMPY.git
WORKDIR SOMPY
RUN python setup.py install

RUN conda clean -y -a
WORKDIR /home/jovyan
