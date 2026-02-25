library(Biostrings)

setwd("~/WorkSpace/BioSci700//Lab1")

dna <- readDNAStringSet("influenza_HA_raw.fasta")
aa  <- translate(dna)

writeXStringSet(aa, "influenza_HA_translated.fasta")
