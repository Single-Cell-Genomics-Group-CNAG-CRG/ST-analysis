FROM rocker/tidyverse:4.0.1

MAINTAINER Marc Elosua-Bayes

#### Install SpaceDecon packages ####
RUN apt-get update -y && \
    apt-get install -y \
    fftw3-dev \
    imagemagick \
    libudunits2-dev \
    libv8-dev \
    libhdf5-dev \
    libgdal-dev \
    libpng-dev \
    libgsl-dev \
    libxt-dev \
    libcairo2-dev \
    libtiff-dev \
    libgmp3-dev \
    zlib1g-dev \
    libssl-dev \
    libssh2-1-dev \
    libxml2-dev \
    libgmp-dev \
    fftw-dev \
    r-cran-igraph \
    libglpk-dev

#### Install CRAN packages ####
RUN R -e "install.packages(c('gt', 'cowplot', 'xlsx', 'sf', 'igraph', \
          'ggpubr', 'ggrepel', 'rmarkdown', 'knitr', 'DT', 'NMF', \
          'matrixStats', 'here', 'Matrix', 'Seurat', 'devtools', \
          'remotes', 'spdep', 'gmp', 'arrangements', 'Rmagic', 'imager'))"
 
#### Install bioconductor packages ####
RUN R -e "options(repos = \
          list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2021-05-30')); \
          install.packages('BiocManager')"

#### Install bioconductor packages ####
RUN R -e "BiocManager::install(pkgs = c('progeny', 'dorothea', 'multtest'))"

# error arising because some packages come from slightly different R minor versions after R4
# https://github.com/r-lib/remotes/issues/403
# Our own rmassonix interacted encountered this issue installing scRepertoire
# https://github.com/ncborcherding/scRepertoire/issues/18

#### GitHub packages
RUN R -e "Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE); \
        devtools::install_github('https://github.com/MarcElosua/SPOTlight'); \
        devtools::install_github('immunogenomics/harmony'); \
        remotes::install_github('mojaveazure/seurat-disk'); \
        devtools::install_github('jbergenstrahle/STUtility'); \
        remotes::install_github('saezlab/mistyR')"

