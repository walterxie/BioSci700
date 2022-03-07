library("ape")

setwd("~/WorkSpace/BioSci700")

alg = read.FASTA("ABCD.fasta")

# 20 sites
d = dist.dna(alg, model = "raw") * 20


