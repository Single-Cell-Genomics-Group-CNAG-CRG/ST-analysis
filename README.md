# ST-analysis
General notes and resources on how to analyze Spatial Transcriptomics data

## Resources of interest
- http://spatialomics.net/

## Software to handle ST data

### R
- [Seurat v3.2](https://satijalab.org/seurat/v3.2/spatial_vignette.html) developed by Rahul Satija lab.
- [STUtility](https://github.com/jbergenstrahle/STUtility) developed by Joseph Bergenstråhle and Ludvig Larsson from  Joakim Lundeberg lab.
- [Giotto](http://spatialgiotto.rc.fas.harvard.edu/) developed by Ruben Dries from Guo-Cheng Yuan lab.
- [Spaniel](https://www.biorxiv.org/content/10.1101/619197v1) developed by Rachel Queen

### Python
- [scanpy](https://scanpy-tutorials.readthedocs.io/en/latest/spatial/basic-analysis.html) developed by Giovanni Palla from Fabian Theis Lab.

### Tools of interest
- [SpatialDE](https://www.nature.com/articles/nmeth.4636) developed by Valentine Svensson. A statistical test to identify genes with spatial patterns of expression variation from multiplexed imaging or spatial RNA-sequencing data.
- [MISTy](https://saezlab.github.io/misty/) developed by Jovan Tanevski from Saez-Rodriguez lab.  Multiview Intercellular SpaTial modeling framework (**MISTy**) is an explainable machine learning framework for knowledge extraction and analysis of single-cell, highly multiplexed, spatially resolved data. MISTy facilitates an in-depth understanding of marker interactions by profiling the intra- and intercellular relationships.
- [PROGENy](https://www.bioconductor.org/packages/release/bioc/vignettes/progeny/inst/doc/ProgenySingleCell.html). Developed by Alberto Valdeolivas from Saez-Rodriguez lab. Estimates the activity of 14 relevant signaling pathways based on consensus gene signatures obtained from perturbation experiments.
- [Omnipath](https://saezlab.github.io/OmnipathR/articles/OmnipathMainVignette.html) Saez-Rodriguez lab. A comprehensive collection of molecular biology prior knowledge from 103 databases, with focus on literature curated human and rodent signaling pathways. Software suite for functional omics data analysis and mechanistic modeling of intra- and inter-cellular signaling.
- [DOROTHEA](https://bioconductor.org/packages/release/data/experiment/html/dorothea.html) Saez-Rodriguez lab.This package contains human and mouse TF regulons. The human regulons were curated and collected from different types of evidence such as literature curated resources, ChIP-seq peaks, TF binding site motifs and interactions inferred directly from gene expression. The mouse regulons were constructed by mapping the human gene symbols to their orthologs in mice. Those regulons can be coupled with any statistical method that aims to analyse gene sets to infer TF activity from gene expression data. Preferably the statistical method viper is used.

## General Comments
Things to keep in mind when processing the data

- Optimal Read length for confident mapping Spaceranger v1.1.0
[Read length mapping](!)


## QC
