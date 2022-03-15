library(ape)
library(phangorn)
setwd("~/WorkSpace/BioSci700")

alg = read.phyDat("covid416.fasta", format = "fasta", type = "DNA")
names(alg)

# 100
sub <- seq(1, 400, by=4)

subAlg = alg[sub]
names(subAlg)

# simple names
names(subAlg) <- gsub("(.*)\\|(.*)\\|(.*)\\|(.*)\\|(.*)\\|(.*)", "\\1\\|\\2\\|\\3|\\4", names(subAlg))

countries <- gsub("(.*)\\|(.*)\\|(.*)\\|(.*)", "\\4", names(subAlg))
unique(countries)

loc <- gsub("(.*)\\|(.*)\\|(.*)\\|(.*)", "\\3", names(subAlg))
unique(loc)

nz <- grep("New_Zealand", names(subAlg))
nz
x <- 1:length(subAlg)
notnz <- x[!x %in% nz]
notnz

names(subAlg)[nz] <- gsub("(.*)\\|(.*)\\|(.*)\\|(.*)", "\\1\\|\\4", names(subAlg)[nz])
names(subAlg)[notnz] <- gsub("(.*)\\|(.*)\\|(.*)\\|(.*)", "\\1\\|\\3", names(subAlg)[notnz])
names(subAlg)

write.phyDat(subAlg, "covid100.fasta", format = "fasta")

loc2 <- gsub("(.*)\\|(.*)", "\\2", names(subAlg))
loc2
l <- data.frame(tips = names(subAlg), loc = loc2, countries = countries)
write.table(l, file = "locations.txt", sep = "\t", quote = F , row.names = F)



