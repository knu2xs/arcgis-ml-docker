FROM jupyter/scipy-notebook AS build

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
    jupyterlab \
    geopandas \
    rtree \
    fiona

RUN conda install -y -c http://zion/conda/master arcgis

RUN conda clean -y -a

# clean everything up
RUN conda clean -y -a
