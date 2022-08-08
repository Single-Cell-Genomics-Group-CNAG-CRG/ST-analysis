conda create --name spatial_r2
conda activate spatial_r2

## Install R and R packages from CRAN
conda install -c conda-forge r-base 
conda install -c conda-forge r-essentials
conda install -c conda-forge r-tidyverse
conda install -c conda-forge r-here
conda install -c conda-forge r-devtools
conda install -c conda-forge r-rjags
conda install -c conda-forge r-sf
conda install -c conda-forge r-dt
conda install -c conda-forge r-ggrepel
conda install -c conda-forge r-remotes
conda install -c conda-forge r-corrplot
conda install -c conda-forge r-ggcorrplot
conda install -c conda-forge r-svglite
conda install -c conda-forge r-openxlsx
conda install -c conda-forge r-gmp 
conda install -c conda-forge r-arrangements
conda install -c conda-forge r-imager
conda install -c conda-forge r-rmagic
conda install -c conda-forge r-flextable
conda install -c conda-forge r-msigdbr
conda install -c conda-forge r-ggrastr
conda install -c conda-forge r-matrix.utils 


## Install Bioconda-Bioconductor packages

#### Initialize bioconda - https://bioconda.github.io/
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

# Seurat doesn't exists in bioconda, we are going to need to install it with conda forge
# conda install -c bioconda r-seurat 
conda install -c conda-forge r-seurat 
conda install -c bioconda bioconductor-reactomegsa
conda install -c bioconda bioconductor-biocgenerics
conda install -c bioconda bioconductor-delayedarray
conda install -c bioconda bioconductor-delayedmatrixstats 
conda install -c bioconda bioconductor-limma 
conda install -c bioconda bioconductor-s4vectors 
conda install -c bioconda bioconductor-singlecellexperiment
conda install -c bioconda bioconductor-summarizedexperiment 
conda install -c bioconda bioconductor-batchelor 
conda install -c bioconda bioconductor-ebimage 
conda install -c bioconda bioconductor-mistyr 
conda install -c bioconda bioconductor-progeny 
conda install -c bioconda bioconductor-dorothea
conda install -c bioconda bioconductor-decoupler 
conda install -c bioconda bioconductor-annotationdbi 
conda install -c bioconda bioconductor-gostats 
conda install -c bioconda bioconductor-clusterprofiler 
conda install -c bioconda bioconductor-org.mm.eg.db
conda install -c bioconda bioconductor-org.hs.eg.db 
conda install -c bioconda bioconductor-biomart 
conda install -c bioconda bioconductor-scran 
conda install -c bioturing r-spotlight 

## Github packages
devtools::install_github("immunogenomics/harmony")
devtools::install_github("jbergenstrahle/STUtility")
remotes::install_github("mojaveazure/seurat-disk")
remotes::install_github("carmonalab/UCell")
devtools::install_github('cole-trapnell-lab/leidenbase')
devtools::install_github("broadinstitute/infercnv")
devtools::install_github("diazlab/CONICS/CONICSmat", dep = TRUE)
devtools::install_github(repo = "kueckelj/confuns")
devtools::install_github(repo = "theMILOlab/SPATA2")
