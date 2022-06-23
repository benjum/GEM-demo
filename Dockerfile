ARG BASE_CONTAINER=jupyter/minimal-notebook
FROM $BASE_CONTAINER

LABEL author="Benjamin Winjum"

USER root

RUN conda install datashader && \
    datashader examples && \
    chown 1000:1000 -R datashader-examples

RUN conda install --quiet --yes \
    'bokeh' \
    'cartopy' \
    'colorcet' \
    'graphviz' \
    'python-graphviz' \
    'dask' \
    'datashader' \
    'distributed' \
    'fastparquet' \
    'holoviews' \
    'ipython' \
    'jupyter' \
    'matplotlib' \
    'networkx>=2.0' \
    'numba' \
    'numpy' \
    'pandas >=0.24.1' \
    'param' \
    'python-snappy' \
    'python' \
    'rasterio' \
    'requests' \
    'scikit-image' \
    'scipy' \
    'shapely' \
    'snappy' \
    'statsmodels' \
    'streamz' \
    'xarray' \
    'ipympl' \
    && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID
