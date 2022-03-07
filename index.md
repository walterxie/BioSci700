In this lab, we will learn how to use R to construct phylogenetic trees
using some basic algorithms, such as UPGMA and Neighbour-joining, etc.

Please download the [alignment](ABCD.fasta), and save it into your
working directory.

    library("ape")
    library(phangorn)
    alg = read.FASTA("ABCD.fasta")

    # setwd("~/WorkSpace/BioSci700")
    alg = read.FASTA("ABCD.fasta")

<https://alexeidrummond.org/bayesian_phylo_lectures/lecture5/#/19>

    # 20 sites
    d = dist.dna(alg, model = "raw") * 20
