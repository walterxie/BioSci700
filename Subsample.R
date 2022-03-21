library(ape)
library(phangorn)
setwd("~/WorkSpace/BioSci700")

aln = read.phyDat("H5N1.fasta", format = "fasta", type = "DNA")
names(aln)

# simple names
species <- gsub("(.*)\\_(.*)\\_(.*)\\_(.*)", "\\1", names(aln))
unique(species)

loc <- gsub("(.*)\\_(.*)\\_(.*)\\_(.*)", "\\2", names(aln))
unique(loc)

year <- gsub("(.*)\\_(.*)\\_(.*)\\_(.*)", "\\4", names(aln))
unique(year)

l <- data.frame(tips = names(aln), loc = loc, species = species, year = year)
write.table(l, file = "locations.txt", sep = "\t", quote = F , row.names = F)



