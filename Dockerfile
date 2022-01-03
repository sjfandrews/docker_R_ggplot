FROM mambaorg/micromamba:0.15.2
COPY --chown=micromamba:micromamba R.yaml /tmp/env.yaml
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes 

RUN R --vanilla -e 'remotes::install_version("mr.raps", version = "0.2", repos=c("http://cran.rstudio.com/"))'
RUN R --vanilla -e 'remotes::install_version("MendelianRandomization", version = "0.5.1", repos=c("http://cran.rstudio.com/"))'
RUN R --vanilla -e 'remotes::install_version("iterpc", version = "0.4.2", repos=c("http://cran.rstudio.com/"))'
RUN R --vanilla -e 'remotes::install_github("rondolab/MR-PRESSO", dependencies=TRUE, repos=c("http://cran.rstudio.com/"))'
RUN R --vanilla -e 'remotes::install_github("gqi/MRMix", dependencies=TRUE, repos=c("http://cran.rstudio.com/"))'
RUN R --vanilla -e 'remotes::install_github("MRCIEU/MRInstruments", dependencies=FALSE, repos=c("http://cran.rstudio.com/"))'
RUN R --vanilla -e 'remotes::install_github("MRCIEU/ieugwasr", dependencies=FALSE, repos=c("http://cran.rstudio.com/"))'
RUN R --vanilla -e 'remotes::install_github("WSpiller/RadialMR", dependencies=FALSE, repos=c("http://cran.rstudio.com/"))'
RUN R --vanilla -e 'remotes::install_github("MRCIEU/TwoSampleMR@0.5.6", dependencies=FALSE, repos=c("http://cran.rstudio.com/"))'



