# Guidelines Spatial Transcriptomics

This is a guide to install basic tools for ST analysis using a conda environment for the sake of reproducibility. 

# Commands to follow

This HTML was created with Notion. In Notion, you can create `inline code snippets` with the shortcut `cmd/ctrl + e`.

```bash
conda create -n spatial_r
conda activate spatial_r
conda install -c conda-forge r-base=4.0.1
```

**Install SPATA2**

The following package is a dependency for some of the BiocManager packages that will be installed in the future.

```bash
conda install -c eumetsat fftw3
#conda install -c conda-forge imagemagick #necessary for the cluster
#conda install -c conda-forge pandoc #necessary for the cluster
```

Now let's go to R

```bash
R
```

```r
install.packages("devtools")
if (!base::requireNamespace("BiocManager", quietly = TRUE)){
      install.packages("BiocManager")
  }
BiocManager::install(c('BiocGenerics', 'DelayedArray', 'DelayedMatrixStats',
                       'limma', 'S4Vectors', 'SingleCellExperiment',
                       'SummarizedExperiment', 'batchelor', 'Matrix.utils', 
                       'EBImage'))

install.packages("Seurat")
devtools::install_github(repo = "kueckelj/confuns")
```

The following commands are needed to use SPATA2 infercnv function 

```bash
conda install -c conda-forge xorg-libx11
R
```

```r
BiocManager::install("biomaRt")
BiocManager::install("scran")
devtools::install_github("diazlab/CONICS/CONICSmat", dep = TRUE)
```

```bash
conda install -c conda-forge jags
R
```

```r
install.packages("rjags")
devtools::install_github("broadinstitute/infercnv")
```

Go back to the terminal  and use conda to install the following:

```bash
conda install -c conda-forge udunits2
##libgal package downstream will install proj and r-proj4 automatically 
##but I pre-installed in this order of commands
#conda install -c conda-forge r-proj4 
conda install -c conda-forge r-v8
```

```bash
##the commented lines were executed but I'm not sure those made any difference
#sudo apt remove libudunits2-dev libgdal-dev libgeos-dev libproj-dev
#sudo apt install libudunits2-dev libgdal-dev libgeos-dev libproj-dev libfontconfig1-dev
conda install -c conda-forge libgdal
R
```

```r
install.packages("sf")
devtools::install_github(repo = "theMILOlab/SPATA2")
devtools::install_github('cole-trapnell-lab/leidenbase')
```

**Install common packages**

```r
install.packages("tidyverse")
install.packages("gt")
install.packages("ggpubr")
install.packages("ggrepel")
install.packages("rmarkdown")
install.packages("knitr")
install.packages("DT")
install.packages("here")

if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
remotes::install_github("mojaveazure/seurat-disk")

#install.packages("spdep") #necessary for the cluster

devtools::install_github(
    "jbergenstrahle/STUtility"
)

remotes::install_github("saezlab/mistyR")

BiocManager::install("progeny")
BiocManager::install("dorothea")

install.packages("corrplot")
install.packages("ggcorrplot")
BiocManager::install("AnnotationDbi")
BiocManager::install("GOstats")
devtools::install_github("Single-Cell-Genomics-Group-CNAG-CRG/CNAGSCG-package", 
ref = "main")
install.packages("svglite")
BiocManager::install("clusterProfiler")
BiocManager::install("org.Mm.eg.db")
BiocManager::install("org.Hs.eg.db")
```

```bash
conda install -c conda-forge openjdk
conda install -c r r-xlsx
conda install -c bioconda bioconductor-nebulosa # try with R with BiocManager::install("Nebulosa")
```

**Install SPOTlight**

In the terminal, install this 

```bash
conda install -c anaconda gmp
```

```r
install.packages("gmp")
install.packages("arrangements")
```

I encountered lots of problems to install `imager` from CRAN due to X11 library. That's why the following commands are commented because I don't know whether they influenced in the final installation of `r-imager` by conda.

```bash
#conda install -c conda-forge xorg-libx11
#conda install -c borismarin libx11
#sudo apt install xorg
#sudo apt install libx11-dev
conda install -c conda-forge r-imager
```

```bash
devtools::install_github("https://github.com/MarcElosua/SPOTlight")
```

**Install Harmony**

```r
devtools::install_github("immunogenomics/harmony")
```

**Install MAGIC**

```r
conda install -c bioconda scprep
conda install matplotlib future tasklogger graphtools scipy pandas Deprecated pygsp pytz python-dateutil six threadpoolctl joblib decorator wrapt cycler kiwisolver pyparsing pillow
conda install -c anaconda zlib
R
install.packages("Rmagic")
```

# Cluster

Load all these modules to be able to install SPATA2 in the cluster

```bash
module load R/4.0.1 PROJ/7.0.1 GDAL/2.4.2 GEOS/3.4.2 UDUNITS/2.2.26
install.packages("sf", configure.args = c(sf = "--with-proj-include=/apps/PROJ/7.0.1/include"))
```

# Reactome
```r
BiocManager::install("ReactomeGSA")
```

# Misc packagesd
Flextable for pretty tables
```
 conda install -c conda-forge r-flextable 
```
