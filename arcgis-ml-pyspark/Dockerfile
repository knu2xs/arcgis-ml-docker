FROM jupyter/pyspark-notebook AS build

# add conda-forge and esri to list of channels
RUN conda config --prepend channels esri
RUN conda config --prepend channels conda-forge

# ensure most recent version of Conda is installed
RUN conda update -n base conda

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

RUN conda clean -y -a