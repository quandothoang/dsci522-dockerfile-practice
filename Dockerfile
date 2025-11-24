FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

COPY conda-linux-64.lock /tmp/conda-linux-64.lock

USER ${NB_UID}

RUN conda install --yes --file /tmp/conda-linux-64.lock && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"