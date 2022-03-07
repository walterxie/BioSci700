library("ape")
library(phangorn)
setwd("~/WorkSpace/BioSci700")

alg = read.FASTA("ABCD.fasta")

# 20 sites
d = dist.dna(alg, model = "raw") * 20

treeUPGMA <- upgma(d)
plot(treeUPGMA, main="UPGMA")

treeNJ <- NJ(d)
plot(treeNJ, "unrooted", main="NJ")


algPD = phyDat(alg)

parsimony(treeUPGMA, algPD)

parsimony(treeNJ, algPD)

optim.parsimony(treeUPGMA, algPD)


