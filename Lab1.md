In this lab, we will learn how to use R to construct phylogenetic trees
using some basic algorithms, such as UPGMA and Neighbour-joining, etc.

Please download the nucleotide [alignment](ABCD.fasta), and save it into
your working directory. You can preview the alignment by using any text
editor to open the file.

We also need two R libraries: “ape” and “phangorn”. If your R has not
got them, please use `install.packages` to install them.

## 1. Pairwise distances

Let’s load “ape” first into R:

    library(ape)

Make sure the the alignment file is in your working directory, then load
the alignment from the fasta file:

    # setwd("~/WorkSpace/BioSci700")
    alg = read.FASTA("ABCD.fasta")

This alignment has 4 taxa and 20 sites. The nucleotides were composited
to create the distance matrix in [Lecture
5](https://alexeidrummond.org/bayesian_phylo_lectures/lecture5/#/19).

Using the function `dist.dna` to compute the distribution of pairwise
distances, we can multiple it with the number of sites (20) to obtain
the matrix of pairwise distances.

    # 20 sites
    d = dist.dna(alg, model = "raw") * 20
    d

    ##    A  B  C
    ## B  8      
    ## C  7  9   
    ## D 12 14 13

**Question 1 :** what does this matrix tell us?

## 2. Algorithms

Secondly, we will use the library “phangorn” to create trees.

    library(phangorn)

### 2.1 UPGMA

Now, please reuse the distance matrix `d` and compute the UPGMA tree.
Use `plot` function to draw the tree.

    treeUPGMA <- upgma(d)
    plot(treeUPGMA, main="UPGMA")

![](Lab1_files/figure-markdown_strict/unnamed-chunk-5-1.png)

### 2.2 Neighbour-joining

Then compute the neighbour-joining tree. As it produces unrooted trees,
you need to add the “unrooted” argurment to the `plot` function.

    treeNJ <- NJ(d)
    plot(treeNJ, "unrooted", main="NJ")

![](Lab1_files/figure-markdown_strict/unnamed-chunk-6-1.png)

**Question 2 :** what is pros and cons of the neighbour-joining
algorithm?

### 2.3 Parsimony

To understand the parsimony method, we need a more complex alignment
“primates”. Please use the following commands to load it from the
package “phangorn”:

    fdir <- system.file("extdata/trees", package = "phangorn")
    primates <- read.phyDat(file.path(fdir, "primates.dna"), format = "interleaved")
    primates

    ## 14 sequences with 232 character and 217 different site patterns.
    ## The states are a c g t

This alignment has 14 sequences with 232 character and sequences have
217 different site patterns. You can try `str(primates)` to show the
details. Then respectively create the UPGMA and NJ tree:

    dm  <- dist.ml(primates)
    treeUPGMA  <- upgma(dm)
    treeNJ  <- NJ(dm)

### 2.3 Parsimony

To understand the parsimony method, we need a more complex example.
Please follow the “phangorn”
[tutorial](https://cran.r-project.org/web/packages/phangorn/vignettes/Trees.html)
to load the alignment “primates”, and respectively create the UPGMA and
NJ tree.

    parsimony(treeUPGMA, primates)

    ## [1] 751

    parsimony(treeNJ, primates)

    ## [1] 746

    plotBS(treePars, bs.pars, main="Parsimony NNI", "phylogram")

![](Lab1_files/figure-markdown_strict/unnamed-chunk-12-1.png)

    #plot(treePars)
