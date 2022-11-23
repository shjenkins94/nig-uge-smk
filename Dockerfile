FROM condaforge/mambaforge:4.14.0-0
ENV TINI_SUBREAPER=
ENV MALLOC_ARENA_MAX=3
ENV OMPI_MCA_btl=^openib
RUN apt-get -y update \
    && apt-get -y install \
    apt-utils \
    parallel
RUN conda config --system --set channel_priority strict
RUN /bin/bash -c "mamba install -y -n base -c conda-forge -c bioconda snakemake-minimal && mamba clean --all --yes"
RUN echo 'will cite' | parallel --citation || true