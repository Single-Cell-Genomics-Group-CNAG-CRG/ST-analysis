qc_covar_plots <- function(se,
                           nfeat = "nFeature_Spatial",
                           ncount = "nCount_Spatial",
                           slot = "counts",
                           assay = "Spatial",
                           percent.mito = NULL,
                           percent.ribo = NULL,
                           facet = NULL) {
  ### se: Seurat object
  require(ggplot2)
  require(Seurat)
  require(ggpubr)
  
  ## Compute mito and ribo %
  count_mtrx <- Seurat::GetAssayData(object = se,
                                     slot = slot,
                                     assay = assay)
  
  # Collect all genes coded on the mitochondrial genome
  if (is.null(percent.mito)) {
    mt.genes <- grep(pattern = "^MT-",
                     x = rownames(count_mtrx),
                     value = TRUE,
                     ignore.case = TRUE)
    se_obj[["percent.mito"]] <- (Matrix::colSums(count_mtrx[mt.genes, ]) /
                                   Matrix::colSums(count_mtrx)) * 100
  } else {
    se_obj[["percent.mito"]] <- se_obj[[percent.mito]]
  }
  
  
  # Collect all genes coding for ribosomal proteins
  if (is.null(percent.ribo)) {
    rp.genes <- grep(pattern = "^RPL|^RPS",
                     x = rownames(count_mtrx),
                     value = TRUE,
                     ignore.case = TRUE)
    se_obj[["percent.ribo"]] <- (Matrix::colSums(count_mtrx[rp.genes, ]) /
                                   Matrix::colSums(count_mtrx)) * 100
  } else {
    se_obj[["percent.ribo"]] <- se_obj[[percent.ribo]]
  }
  
  p1 <- ggplot2::ggplot() +
    ggplot2::geom_point(data = se[[]], 
                        ggplot2::aes_string(x = ncount,
                                            y = nfeat,
                                            color = "percent.mito"),
                        alpha = 0.7) +
    scale_color_gradient(low = "yellow", high = "red", na.value = NA) +
    ggplot2::ggtitle("Library size vs Detected genes") +
    ggplot2::labs(x = "Library Size", y = "Unique UMIs") +
    ggpubr::theme_pubr()
  
  if (!is.null(facet)) {
    p1 <- p1 + ggplot2::facet_wrap(facet, scales = "free")
  }
  
  p2 <- ggplot2::ggplot() +
    ggplot2::geom_point(data = se[[]], 
                        ggplot2::aes_string(x = ncount,
                                            y = nfeat,
                                            color = "percent.ribo"),
                        alpha = 0.7) +
    ggplot2::scale_color_gradient(low = "yellow", high = "red", na.value = NA) +
    ggplot2::ggtitle("Library size vs Detected genes") +
    ggplot2::labs(x = "Library Size", y = "Unique UMIs") +
    ggpubr::theme_pubr()
  
  if (!is.null(facet)) {
    p2 <- p2 + ggplot2::facet_wrap(facet, scales = "free")
  }
  
  p3 <- ggplot2::ggplot() +
    ggplot2::geom_point(data = se_obj[[]], 
                        ggplot2::aes_string(x = "percent.mito",
                                            y = nfeat,
                                            color = ncount),
                        alpha = 0.7) +
    ggplot2::scale_color_gradient(low = "yellow", high = "red", na.value = NA) +
    ggplot2::ggtitle("Mitochondrial % per spot") +
    ggplot2::labs(x = "Mitochondrial % ", y = "Unique UMIs") +
    ggpubr::theme_pubr()
  
  if (!is.null(facet)) {
    p3 <- p3 + ggplot2::facet_wrap(facet, scales = "free")
  }
  
  p4 <- ggplot2::ggplot() +
    ggplot2::geom_point(data = se_obj[[]], 
                        ggplot2::aes(x = percent.mito,
                                     y = percent.ribo),
                        fill = "red",
                        alpha = 0.7,
                        color = "red") +
    ggplot2::ggtitle("Mitochondrial % per spot") +
    ggplot2::labs(x = "Mitochondrial % ", y = "Ribosomal %") +
    ggpubr::theme_pubr()
  
  if (!is.null(facet)) {
    p4 <- p4 + ggplot2::facet_wrap(facet, scales = "free")
  }
  
  return(list(p1, p2, p3, p4))
}

################################################################################
################################################################################
################################################################################

qc_st_plots <- function(se,
                        nfeat = "nFeature_Spatial",
                        ncount = "nCount_Spatial",
                        slot = "counts",
                        assay = "Spatial",
                        percent.mito = NULL,
                        percent.ribo = NULL) {
  ### se: Seurat object
  require(ggplot2)
  require(Seurat)
  
  p1 <- Seurat::SpatialFeaturePlot(object = se,
                                   features = nfeat) +
    ggplot2::ggtitle("Unique genes per spot")
  
  p2 <- Seurat::SpatialFeaturePlot(object = se,
                                   features = ncount) +
    ggplot2::ggtitle("Total counts per spots")
  
  count_mtrx <- Seurat::GetAssayData(object = se,
                                     slot = slot, assay = assay)
  gene_attr <- data.frame(nUMI = Matrix::rowSums(count_mtrx), 
                          nSpots = Matrix::rowSums(count_mtrx > 0))
  
  # Collect all genes coded on the mitochondrial genome
  if (is.null(percent.mito)) {
    mt.genes <- grep(pattern = "^MT-",
                     x = rownames(count_mtrx),
                     value = TRUE,
                     ignore.case = TRUE)
    se_obj[["percent.mito"]] <- (Matrix::colSums(count_mtrx[mt.genes, ]) /
                                   Matrix::colSums(count_mtrx)) * 100
  } else {
    se_obj[["percent.mito"]] <- se_obj[[percent.mito]]
  }
  
  
  # Collect all genes coding for ribosomal proteins
  if (is.null(percent.ribo)) {
    rp.genes <- grep(pattern = "^RPL|^RPS",
                     x = rownames(count_mtrx),
                     value = TRUE,
                     ignore.case = TRUE)
    se_obj[["percent.ribo"]] <- (Matrix::colSums(count_mtrx[rp.genes, ]) /
                                   Matrix::colSums(count_mtrx)) * 100
  } else {
    se_obj[["percent.ribo"]] <- se_obj[[percent.ribo]]
  }
  
  p3 <- Seurat::SpatialFeaturePlot(object = se,
                                   features = "percent.mito") +
    ggplot2::ggtitle("Mitochondrial % per spot")
  
  p4 <- Seurat::SpatialFeaturePlot(object = se,
                                   features = "percent.ribo") +
    ggplot2::ggtitle("Ribosomal % per spot")
  
  
  return(list(p1, p2, p3, p4))
}

################################################################################
################################################################################
################################################################################

qc_hist_plots <- function(se,
                          nfeat = "nFeature_Spatial",
                          ncount = "nCount_Spatial",
                          slot = "counts",
                          assay = "Spatial",
                          percent.mito = NULL,
                          percent.ribo = NULL) {
  ### se: Seurat object
  require(ggplot2)
  require(Seurat)
  require(ggpubr)
  
  p1 <- ggplot2::ggplot() +
    ggplot2::geom_histogram(data = se[[]], 
                            ggplot2::aes_string(nfeat),
                            fill = "red",
                            alpha = 0.7,
                            color = "red",
                            bins = 50) +
    ggplot2::ggtitle("Unique genes per spot") +
    ggplot2::labs(x = "Number of Detected Genes",
                  y = "Number of Spots") +
    ggpubr::theme_pubr()
  
  p2 <- ggplot2::ggplot() +
    ggplot2::geom_histogram(data = se[[]],
                            ggplot2::aes_string(ncount),
                            fill = "red",
                            alpha = 0.7,
                            color = "red",
                            bins = 50) +
    ggplot2::ggtitle("Total counts per spots") +
    ggplot2::labs(x = "Library Size (total UMI)",
                  y = "Number of Spots") +
    ggpubr::theme_pubr()
  
  count_mtrx <- Seurat::GetAssayData(object = se, slot = slot, assay = assay)
  gene_attr <- data.frame(nUMI = Matrix::rowSums(count_mtrx), 
                          nSpots = Matrix::rowSums(count_mtrx > 0))
  p3 <- ggplot2::ggplot() +
    ggplot2::geom_histogram(data = gene_attr,
                            ggplot2::aes(nUMI),
                            fill = "red",
                            alpha = 0.7,
                            color = "red",
                            bins = 50) +
    ggplot2::scale_x_log10() +
    ggplot2::ggtitle("Total counts per gene (log10 scale)") +
    ggpubr::theme_pubr()
  
  p4 <- ggplot2::ggplot() +
    ggplot2::geom_histogram(data = gene_attr,
                            ggplot2::aes(nSpots),
                            fill = "red",
                            alpha = 0.7,
                            color = "red",
                            bins = 50) +
    ggplot2::ggtitle("Total spots per gene") +
    ggpubr::theme_pubr()
  
  # Collect all genes coded on the mitochondrial genome
  if (is.null(percent.mito)) {
    mt.genes <- grep(pattern = "^MT-",
                     x = rownames(count_mtrx),
                     value = TRUE,
                     ignore.case = TRUE)
    se_obj[["percent.mito"]] <- (Matrix::colSums(count_mtrx[mt.genes, ]) /
                                   Matrix::colSums(count_mtrx)) * 100
  } else {
    se_obj[["percent.mito"]] <- se_obj[[percent.mito]]
  }
  
  
  # Collect all genes coding for ribosomal proteins
  if (is.null(percent.ribo)) {
    rp.genes <- grep(pattern = "^RPL|^RPS",
                     x = rownames(count_mtrx),
                     value = TRUE,
                     ignore.case = TRUE)
    se_obj[["percent.ribo"]] <- (Matrix::colSums(count_mtrx[rp.genes, ]) /
                                   Matrix::colSums(count_mtrx)) * 100
  } else {
    se_obj[["percent.ribo"]] <- se_obj[[percent.ribo]]
  }
  
  p5 <- ggplot2::ggplot() +
    ggplot2::geom_histogram(data = se_obj[[]], 
                            ggplot2::aes(percent.mito),
                            fill = "red",
                            alpha = 0.7,
                            color = "red",
                            bins = 50) +
    ggplot2::ggtitle("Mitochondrial % per spot") +
    ggplot2::labs(x = "Mitochondrial % ",
                  y = "Number of Spots") +
    ggpubr::theme_pubr()
  
  p6 <- ggplot2::ggplot() +
    ggplot2::geom_histogram(data = se_obj[[]], 
                            ggplot2::aes(percent.ribo),
                            fill = "red",
                            alpha = 0.7,
                            color = "red",
                            bins = 50) +
    ggplot2::ggtitle("Ribosomal % per spot") +
    ggplot2::labs(x = "Ribosomal % ",
                  y = "Number of Spots") +
    ggpubr::theme_pubr()
  
  
  return(list(p1, p2, p3, p4, p5, p6))
}

################################################################################
################################################################################
################################################################################
