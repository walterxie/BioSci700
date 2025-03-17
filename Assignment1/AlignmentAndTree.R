library(ape)
library(phangorn)

# change this to your path
setwd("~/WorkSpace/BioSci700/Assignment1")
globAlign <- read.FASTA(file.path("data", "global.fasta"))

# Modify sequence names (keep only "Species|Accession")
names(globAlign) <- sub("^([^ ]+\\|[^ ]+).*", "\\1", names(globAlign))
globAlign

dm  <- dist.ml(globAlign)
dm

treeUPGMA <- upgma(dm)
plot(treeUPGMA, use.edge.length=T, no.margin=TRUE)
edgelabels(round(treeUPGMA$edge.length,4)) 

treeNJ <- NJ(dm)
plot(treeNJ, type="unrooted", use.edge.length=T, no.margin=TRUE)
edgelabels(round(treeNJ$edge.length,4))





