In this lab, we will learn how to use R to construct phylogenetic trees
using some basic algorithms, such as UPGMA and Neighbour-joining, etc.

Please download the nucleotide [alignment](ABCD.fasta), and save it into
your working directory. You can preview the alignment by using any text
editor to open the file.

We also need two R libraries: “ape” and “phangorn”. If your R has not
got them, please use `install.packages` to install them. Let’s load
“ape” first into R:

    library(ape)

Make sure the the alignment file is in your working directory, then load
the alignment:

    # setwd("~/WorkSpace/BioSci700")
    alg = read.FASTA("ABCD.fasta")

This alignment has 4 taxa and 20 sites. The nucleotides were composited
to create the distance matrix in [Lecture
5](https://alexeidrummond.org/bayesian_phylo_lectures/lecture5/#/19).

Using the function `dist.dna` to compute the distribution of distances,
we can multiple it with the number of sites (20) to obtain the matrix of
pairwise distances.

    # 20 sites
    d = dist.dna(alg, model = "raw") * 20
    d

    ##    A  B  C
    ## B  8      
    ## C  7  9   
    ## D 12 14 13

    library(phangorn)

    treeUPGMA <- upgma(d)
    plot(treeUPGMA, main="UPGMA")

![](Lab1_files/figure-markdown_strict/unnamed-chunk-5-1.png)

    treeNJ <- NJ(d)
    plot(treeNJ, "unrooted", main="NJ")

![](Lab1_files/figure-markdown_strict/unnamed-chunk-6-1.png)
