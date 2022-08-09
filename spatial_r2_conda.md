conda create --name spatial_r2
conda activate spatial_r2

#### Initialize bioconda - https://bioconda.github.io/
Initialize the channels from where to install the packages
```
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict
```

## Install R and R packages from CRAN
```
conda install -y -c conda-forge r-base 
conda install -y -c conda-forge r-essentials
conda install -y -c conda-forge r-tidyverse
conda install -y -c conda-forge r-here
conda install -y -c conda-forge r-devtools
conda install -y -c conda-forge r-rjags
conda install -y -c conda-forge r-sf
conda install -y -c conda-forge r-dt
conda install -y -c conda-forge r-ggrepel
conda install -y -c conda-forge r-remotes
conda install -y -c conda-forge r-corrplot
conda install -y -c conda-forge r-ggcorrplot
conda install -y -c conda-forge r-svglite
conda install -y -c conda-forge r-openxlsx
conda install -y -c conda-forge r-gmp 
conda install -y -c conda-forge r-arrangements
conda install -y -c conda-forge r-imager
conda install -y -c conda-forge r-rmagic
conda install -y -c conda-forge r-flextable
conda install -y -c conda-forge r-msigdbr
conda install -y -c conda-forge r-ggrastr
conda install -y -c conda-forge r-matrix.utils 
conda install -y -c conda-forge r-seurat 
```

## Install Bioconductor packages
```
conda install -y -c bioconda bioconductor-reactomegsa
conda install -y -c bioconda bioconductor-biocgenerics
conda install -y -c bioconda bioconductor-delayedarray
conda install -y -c bioconda bioconductor-delayedmatrixstats 
conda install -y -c bioconda bioconductor-limma 
conda install -y -c bioconda bioconductor-s4vectors 
conda install -y -c bioconda bioconductor-singlecellexperiment
conda install -y -c bioconda bioconductor-summarizedexperiment 
conda install -y -c bioconda bioconductor-batchelor 
conda install -y -c bioconda bioconductor-ebimage 
conda install -y -c bioconda bioconductor-mistyr 
conda install -y -c bioconda bioconductor-progeny 
conda install -y -c bioconda bioconductor-dorothea
conda install -y -c bioconda bioconductor-decoupler 
conda install -y -c bioconda bioconductor-annotationdbi 
conda install -y -c bioconda bioconductor-gostats 
conda install -y -c bioconda bioconductor-clusterprofiler 
conda install -y -c bioconda bioconductor-org.mm.eg.db
conda install -y -c bioconda bioconductor-org.hs.eg.db 
conda install -y -c bioconda bioconductor-biomart 
conda install -y -c bioconda bioconductor-scran 
conda install -y -c bioturing r-spotlight 
```

## Github packages
```
devtools::install_github("immunogenomics/harmony")
devtools::install_github("jbergenstrahle/STUtility")
remotes::install_github("mojaveazure/seurat-disk")
remotes::install_github("carmonalab/UCell")
devtools::install_github('cole-trapnell-lab/leidenbase')
devtools::install_github("broadinstitute/infercnv")
devtools::install_github("diazlab/CONICS/CONICSmat", dep = TRUE)
devtools::install_github(repo = "kueckelj/confuns")
devtools::install_github(repo = "theMILOlab/SPATA2")
```
