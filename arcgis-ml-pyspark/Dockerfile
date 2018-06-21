FROM jupyter/pyspark-notebook AS build

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

# install Modivius SDK
# RUN mkdir -p ~/workspace
# WORKDIR /home/jovyan/workspace
# RUN git clone https://github.com/movidius/ncsdk.git
# USER root
# RUN cd /home/jovyan/workspace/ncsdk && \
#     make install
#    make examples