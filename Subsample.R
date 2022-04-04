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

# assignment 2
aln = read.phyDat("YFV-codon.nex", format = "nexus", type = "DNA")
names(aln)

loc <- gsub("^.+\\_(.*)", "\\1", names(aln), perl = TRUE)
unique(loc)

amc <- c("Trinidad","Brazil","Peru","Venezuela","Panama","Ecuador","Colombia","Bolivia")
isAmc <- loc %in% amc 

l <- data.frame(tips = names(aln), loc = loc, isAmc = isAmc)
write.table(l, file = "locations2.txt", sep = "\t", quote = F , row.names = F)
