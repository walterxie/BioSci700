### Download sequences
### @Copyright ChatGPT :-)

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("genbankr")
BiocManager::install("Biostrings")
install.packages("rentrez")   # if not installed

library(rentrez)

setwd("~/WorkSpace/BioSci700/Lab1")

###
# download DNA
###

metadata <- read.delim("influenza_HA_20_metadata.tsv", stringsAsFactors = FALSE)
accessions <- metadata$accession

# Fetch FASTA sequences from NCBI
fasta_sequences <- entrez_fetch(
  db = "nucleotide",
  id = accessions,
  rettype = "fasta",
  retmode = "text"
)

# Write to file
writeLines(fasta_sequences, "influenza_HA_raw.fasta")

###
# translate DNA
###

library(Biostrings)

dna <- readDNAStringSet("influenza_HA_raw.fasta")
aa  <- translate(dna)

writeXStringSet(aa, "influenza_HA_translated.fasta")


###
# download CDS
###

library(genbankr)
library(Biostrings)

# Fetch GenBank records
gb_text <- entrez_fetch(db = "nucleotide",
                        id = accessions,
                        rettype = "gb",
                        retmode = "text")

# Split multi-record text
gb_list <- strsplit(gb_text, "\n//")[[1]]
# clean the list, otherwise extraction will throw err
gb_list <- trimws(gb_list)
gb_list <- gb_list[gb_list != ""]
length(gb_list)             # number of GenBank records
gb_list[[length(gb_list)]]  # last record

# Extract translations
proteins <- lapply(seq_along(gb_list), function(i) {
  cat(paste("i = "), i, "\n")
  
  # Write single record to temp file
  tmp <- tempfile()
  writeLines(paste0(gb_list[i], "\n//"), tmp)
  
  # Parse GenBank
  gb <- readGenBank(tmp)
  
  cat(paste("id = "), gb@accession, "\n")
  
  
  # Extract first CDS
  cds_feat <- cds(gb)[1, ]
  
  # Extract AAString
  aa <- cds_feat$translation[[1]]
  
  # Build a descriptive FASTA header
  # Example: >accession|protein_id|description
  prot_id <- ifelse(!is.null(cds_feat$protein_id), cds_feat$protein_id, "NA")
  seqnames <- cds_feat@seqnames  # sequence description
  header  <- paste0(gb@accession, "|", prot_id, "|", seqnames)
  
  # Store the AAString with the header as name
  aa_set <- AAStringSet(aa)       # length 1
  names(aa_set) <- header          # assign name
  aa_set
})

# Combine all into a single AAStringSet
protein_set <- do.call(c, proteins)

# Write FASTA file
writeXStringSet(protein_set, "influenza_HA_proteins.fasta")

cat("Protein FASTA written to: influenza_HA_proteins.fasta\n")

###
# extract CDS info
###

cds_list <- list()

cds_list <- lapply(seq_along(gb_list), function(i) {
  cat(paste("i = "), i, "\n")
  
  # Write single record to temp file
  tmp <- tempfile()
  writeLines(paste0(gb_list[i], "\n//"), tmp)
  
  # Parse GenBank
  gb <- readGenBank(tmp)
  
  cat(paste("id = "), gb@accession, "\n")
  
  cds_feat <- cds(gb)[1, ]

  cds_feat
})

# Convert each GRanges to a data frame
df_list <- lapply(cds_list, as.data.frame)

# Combine into single data frame, fill missing columns with NA
cds_table <- dplyr::bind_rows(df_list)
cds_table$seqnames
# any "list" columns need conversion
sapply(cds_table, class)

# Remove column which is list
nolist <- subset(cds_table, select = -gene_synonym)
write.table(nolist, "influenza_HA_CDS_info.tsv", sep = "\t",
            quote = FALSE, row.names = FALSE)

cat("CDS info saved to influenza_HA_CDS_info.tsv\n")


