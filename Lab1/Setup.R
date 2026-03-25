#!/usr/bin/env R

# =============================================================================
# BIOSCI 700 LAB 1 SETUP SCRIPT
# Course: Sequence Alignment and Phylogenetic Analysis
# 
# This script installs and loads all required packages for the lab exercises
# =============================================================================


# =============================================================================
# STEP 1: Install BiocManager (required for Bioconductor packages)
# =============================================================================

cat("Step 1: Setting up BiocManager\n")
cat("------------------------------\n")

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  cat("Installing BiocManager...\n")
  install.packages("BiocManager")
}

library(BiocManager)
cat("✓ BiocManager loaded\n\n")

# =============================================================================
# STEP 2: Install Core Sequence Analysis Packages
# =============================================================================

cat("Step 2: Installing sequence analysis packages\n")
cat("----------------------------------------------\n")

# Bioconductor packages for sequence analysis
BiocManager::install(c("Biostrings", "msa"))
BiocManager::install("pwalgin")

cat("\n")

# =============================================================================
# STEP 3: Install Phylogenetic Analysis Packages
# =============================================================================

cat("Step 3: Installing phylogenetic analysis packages\n")
cat("-------------------------------------------------\n")

install.packages(c("ape", "phangorn", "phytools"))
install.packages("testthat")
cat("\n")

# =============================================================================
# STEP 4: Install Visualization and Data Manipulation Packages
# =============================================================================

cat("Step 4: Installing visualization and utility packages\n")
cat("----------------------------------------------------\n")

install.packages("tidyverse")
install.packages("ggplot2")
# uncomment if you want to instill ggtree
#install.packages("ggtree")

cat("\n")

