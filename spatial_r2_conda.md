```
conda create --name spatial_r2
conda activate spatial_r2
```


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
conda install -y -c conda-forge r-biocmanager
conda install -y -c conda-forge r-pheatmap
conda install -y -c conda-forge r-hdf5r 
conda install -y -c conda-forge r-ggsci
conda install -y -c conda-forge r-rio
# conda install -y -c conda-forge r-terra
install.packages("colorBlindness")
# module load CMake/3.23.1-GCCcore-11.3.0
install.packages("ggpubr")
install.packages("RcppML")
install.packages('SoupX')
/scratch/groups/singlecell/software/anaconda3/envs/spatial_r2/bin/pip3 install magic-impute
```

## Install Bioconductor packages
```
conda install -y bioconductor-reactomegsa
conda install -y bioconductor-biocgenerics
conda install -y bioconductor-delayedarray
conda install -y bioconductor-delayedmatrixstats 
conda install -y bioconductor-limma 
conda install -y bioconductor-s4vectors 
# conda install -y -c bioconda scrublet 
# Due to a  conda issue we had to install the dependency GenomeInfoDbData through R. Issue [here](https://github.com/bioconda/bioconda-recipes/issues/13846)
BiocManager::install("GenomeInfoDbData")
BiocManager::install("SingleCellExperiment")
BiocManager::install("SummarizedExperiment")
BiocManager::install("batchelor")
BiocManager::install("mistyR")
BiocManager::install("progeny")
BiocManager::install("dorothea")
BiocManager::install("decoupleR")
BiocManager::install("liana")
BiocManager::install("AnnotationDbi")
BiocManager::install("GOstats")
BiocManager::install("clusterProfiler")
BiocManager::install("org.Mm.eg.db")
BiocManager::install("org.Hs.eg.db")
BiocManager::install("biomaRt")
BiocManager::install("scran")
BiocManager::install("ComplexHeatmap")
BiocManager::install("SpatialExperiment")
BiocManager::install("nnSVG")
BiocManager::install("BayesSpace")
BiocManager::install("SingleR")
# BiocManager::install("UCell")

# ERROR: dependency ‘fftwtools’ is not available for package ‘EBImage’
# install fftwtools from bioconda
conda install -y r-fftwtools 
BiocManager::install("EBImage")

# conda install -y bioconductor-singlecellexperiment
# conda install -y bioconductor-summarizedexperiment 
# conda install -y bioconductor-batchelor 
# conda install -y bioconductor-ebimage 
# conda install -y bioconductor-mistyr 
# conda install -y bioconductor-progeny 
# conda install -y bioconductor-dorothea
# conda install -y bioconductor-decoupler 
# conda install -y bioconductor-annotationdbi 
# conda install -y bioconductor-gostats 
# conda install -y bioconductor-clusterprofiler 
# conda install -y bioconductor-org.mm.eg.db
# conda install -y bioconductor-org.hs.eg.db 
# conda install -y bioconductor-biomart 
# conda install -y bioconductor-scran

```

## Github packages
```
devtools::install_github("immunogenomics/harmony")
# requires r-terra installed with conda-forge
remotes::install_github("mojaveazure/seurat-disk")
devtools::install_github('cole-trapnell-lab/leidenbase')
devtools::install_github("broadinstitute/infercnv")
devtools::install_github("diazlab/CONICS/CONICSmat", dep = TRUE)
devtools::install_github(repo = "kueckelj/confuns")
devtools::install_github(repo = "MarcElosua/SPOTlight")
devtools::install_github("Single-Cell-Genomics-Group-CNAG-CRG/SCrafty-package", ref = "main")
# ERROR: dependencies ‘concaveman’, ‘ggalt’, ‘magick’ are not available for package ‘SPATA2’
# conda install -y -c conda-forge r-concaveman 
devtools::install_github(repo = "theMILOlab/SPATA2")
# devtools::install_github("jbergenstrahle/STUtility")
# remotes::install_github("carmonalab/UCell")
remotes::install_github("carmonalab/UCell", ref="v1.3")
devtools::install_github("sqjin/CellChat")
devtools::install_github("massonix/HCATonsilData", build_vignettes = FALSE)
remotes::install_github('saezlab/liana')
```
