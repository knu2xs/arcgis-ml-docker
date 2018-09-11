FROM jupyter/scipy-notebook AS build

# Install Conda packages
RUN conda install -y \
    beautifulsoup4 \
    bokeh \
    html5lib \
    ipdb \
    keyring \
    lxml \
    matplotlib \
    pandas \
    pillow \
    numexpr \
    numpy \
    pysal \
    pyshp \
    seaborn \
    scikit-image \
    scikit-learn \
    unzip

RUN conda install -y -c conda-forge \
    shapely \
    jupyterlab \
    geopandas \
    rtree \
    fiona

RUN conda install -y -c esri arcgis

RUN git clone https://github.com/sevamoo/SOMPY.git
WORKDIR SOMPY
RUN python setup.py install

RUN conda clean -y -a
WORKDIR /home/jovyan
