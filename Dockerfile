FROM mambaorg/micromamba:0.15.2
COPY --chown=micromamba:micromamba R.yaml /tmp/env.yaml
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes 
RUN /bin/bash -c R --vanilla -e 'devtools::install_github("rondolab/MR-PRESSO", dependencies=TRUE, repos=c("http://cran.rstudio.com/"))'
RUN /bin/bash -c R --vanilla -e 'devtools::install_github("MRCIEU/TwoSampleMR@0.5.6", dependencies=TRUE, repos=c("http://cran.rstudio.com/"))'

