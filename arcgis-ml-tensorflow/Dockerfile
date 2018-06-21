FROM jupyter/tensorflow-notebook AS build

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