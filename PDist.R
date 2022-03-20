library(ape)
library(phangorn)
library(phytools)
setwd("~/WorkSpace/BioSci700")

alg = read.FASTA("ABCD.fasta")

# 20 sites
d = dist.dna(alg, model = "raw") * 20

treeUPGMA <- upgma(d)
plot(treeUPGMA, use.edge.length=T, no.margin=TRUE)
edgelabels(round(treeUPGMA$edge.length,2))

treeNJ <- NJ(d)
plot(treeNJ, type="unrooted", use.edge.length=T, no.margin=TRUE)
edgelabels(treeNJ$edge.length)

algPD = phyDat(alg)
parsimony(c(treeUPGMA, treeNJ), algPD)

#######
fdir <- system.file("extdata/trees", package = "phangorn")
primates <- read.phyDat(file.path(fdir, "primates.dna"), format = "interleaved")
names(primates)
# rm "Bovine"
primates <- primates[-2]
names(primates)

dm  <- dist.ml(primates)
treeUPGMA  <- upgma(dm)
treeNJ  <- NJ(dm)

plot(treeNJ, type="unrooted", use.edge.length=T, no.margin=TRUE)
edgelabels(round(treeNJ$edge.length, 2))

