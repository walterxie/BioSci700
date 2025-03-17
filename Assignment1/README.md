## Assignment1 : Alignment and Phylogenetic Reconstruction (15 marks)

Due date: 4th April 2025

Your name (UPI)


## Instructions for report submission

  1. Report Format & Template Usage

Write your report using this template and save it as a PDF file.
You may use [Overleaf](https://www.overleaf.com), MS Word, or Google Docs, and then export the final report as a PDF.
The PDF file name must include your name and UPI for identification.

{:start="2"}
  2. Completing the Report

Update the author section in the template with your name and UPI in the header.
Copy all section and subsection titles from the template, along with the questions, and then provide your answers accordingly. Avoid copying the instructions to minimize the number of pages.
Follow all instructions carefully to ensure proper setup and accurate responses from software tools.
The questions are numbered in Roman numerals (e.g., **Question i:**). Each question carries one point, with an additional bonus point for clarity and a well-structured report.

{:start="3"}
  3. Answering Questions

Your responses should be written inside the designated answer blocks.
Ensure that no answer blocks are left blank, except for the example provided in the template.
Replace Your answer with your actual response, limiting each answer to a maximum of 150 words.
For questions requiring screenshots, ensure all images are clear and legible.

Example format:

**Answer starts:**

Your answer

**Answer ends**

{:start="4"}
  4. Finalising & Submitting Your Report

Ensure all questions are answered and that your report is in PDF format.
Verify that your report opens correctly before submission.
Include all relevant figures, along with necessary log and tree files (e.g., iqtree’s tree file *.treefile and log file *.log).

{:start="5"}
  5. File Compression & Naming (optional)

To reduce submission size, compress all your files and sub-folders using the ZIP format only.
The ZIP file must be named with your name and UPI for easy identification.
Before submitting, ensure that the ZIP file can be extracted properly.

By following these instructions, you will ensure a clear, well-organized, and properly formatted submission.


## Project description

In this lab, we will learn downloading and preprocessing data, and explore widely used tools for sequence alignment and phylogenetic tree construction. To make the most of your lab time, please ensure that all [required software](https://walterxie.github.io/BioSci700/) is installed beforehand.


## 1. Multiple sequence alignment (MSA) application (6 points)

In this section, we will practice using homologous sequences from different species to reconstruct evolutionary relationships. We will work with mitochondrial DNA from the following five species:

* Homo sapiens (Human) NC_012920.1
* Pan troglodytes (Chimpanzee) NC_001643.1
* Canis lupus (Dog) NC_002008.4
* Felis catus (Cat) NC_001700.1
* Gallus gallus (Chicken) GU261700.1

### 1.1 Downloading and preprocssing data 

Use the provided accession numbers to download the sequences from the NCBI Nucleotide Database (https://www.ncbi.nlm.nih.gov/nuccore/). Follow these steps:

You can follow the following steps: 

1. Open the NCBI Nucleotide Database in a web browser;
2. In the search bar, enter: "NC_012920.1 OR NC_001643.1 OR NC_002008.4 OR NC_001700.1 OR GU261700.1";
3. Click the "Search" button and select the top five results;
4. Click "Send to"", choose "File", set the format to "FASTA", and click "Create file" to download;
5. Locate the downloaded file (usually named "sequence.fasta"") and move it to your working directory.

For preparing the sequence file, open the FASTA file in a text editor and simplify the sequence labels by modifying the lines that start with ">".
You can use the find option to search for every ">".
Then, replace the long descriptions (e.g. NC_012920.1 Homo sapiens mitochondrion, complete genome) to a concise format (e.g. Human|NC_012920.1).


### 1.2 Pairwise sequence alignment

To begin, we must determine the most appropriate pairwise sequence alignment method for this analysis.

**Question i:** 
Should we apply the local or global alignment method when studying the evolutionary history at the species level? Why?

**Answer starts:**

Your answer

**Answer ends**


### 1.3 Progressive multiple sequence alignment (MSA) method

Progressive MSA methods build alignments iteratively, starting with pairwise alignments and gradually adding more sequences to the alignment.

For this analysis, we will use the software [MAFFT](https://mafft.cbrc.jp/alignment/software/manual/manual.html) to perform a global alignment on the downloaded sequences.

To create the alignment file, "global.fasta", open the terminal and run the following command:

```bash
mafft --maxiterate 1000 --globalpair sequence.fasta > global.fasta
```


### 1.4 Pairwise distances

To begin, ensure the alignment file is located in your working directory. Then, enter the following R code into the RStudio console. This code will load the necessary R libraries and import the alignment from the FASTA file into R:

```R
library(ape)
library(phangorn)

# change this to your path
setwd("~/WorkSpace/BioSci700/Assignment1")
globSeqs <- read.FASTA(file.path("data", "global.fasta"))
```

Next, modify the sequence names to retain only the `Species|Accession` portion, if you did not simplify them previously:

```R
# Modify sequence names (keep only "Species|Accession")
names(globSeqs) <- sub("^([^ ]+\\|[^ ]+).*", "\\1", names(globSeqs))
globSeqs
```

Afterward, use the function `dist.ml` to create a distance matrix.
Pairwise distances are usually calculated based on a model of molecular evolution, which accounts for different rates of mutation at different positions within the sequence.

```R
dm  <- dist.ml(m)
dm
```

**Question ii:** 
Which evolutionary model is used to compute the distances above? How should we interpret the distance matrix "dm" in the context of species evolution?

**Answer starts:**

Your answer

**Answer ends**


### 1.4 Phylogenetic reconstruction

We will practise three algorithms to construct phylogenetic tree:

1. UPGMA

First, we will use the previous distance matrix "dm" to construct the UPGMA tree in R. We can visualize the tree using the "plot" function, and display the branch lengths using "edgelabels":

```R
treeUPGMA <- upgma(dm)
plot(treeUPGMA, use.edge.length=T, no.margin=TRUE)
edgelabels(round(treeUPGMA$edge.length,4)) 
```

{:start="2"}
2. Neighbour-joining

Next, we will compute the neighbour-joining tree. Since the tree produced is unrooted, we need to specify the "unrooted" argument when plotting:

```R
treeNJ <- NJ(dm)
plot(treeNJ, type="unrooted", use.edge.length=T, no.margin=TRUE)
#edgelabels(round(treeNJ$edge.length,4))
```

**Question iii:** 
What are the key assumptions behind UPGMA and neighbour-joining algorithms? How do these assumptions affect the accuracy of the resulting phylogenetic trees?

**Answer starts:**

Your answer

**Answer ends**


{:start="3"}
3. Maximun likelihood

Here, we will construct a Maximum Likelihood (ML) phylogenetic tree using IQ-TREE 2. IQ-TREE is a widely used tool for phylogenetic analysis that selects the "best-fit" substitution model and builds the tree accordingly.

Use the following command to generate a Maximum Likelihood tree from the aligned sequence file (global.fasta).
Make sure to replace "MY_PATH" with the actual path to the directory containing iqtree2.

```bash
/MY_PATH/bin/iqtree2 -s global.fasta
```

Upon execution, IQ-TREE 2 automatically selects the most suitable DNA substitution model using ModelFinder and then infers the best Maximum Likelihood tree based on that model.

Check the log file generated by IQ-TREE (e.g., global.fasta.log). Identify the "best-fit" substitution model selected.

**Question iv:** 
What is the "best-fit" substitution model selected for this dataset? What is its log-likelihood?
Provide a brief but precise description of the selected model and why it might be suitable for this dataset.

**Answer starts:**

Your answer

**Answer ends**

The resulting Maximum Likelihood tree will be saved in the file "global.fasta.treefile".
Visualize the tree using a suitable tree viewer (e.g., FigTree, IcyTree, or R packages like ggtree).
Please attach the image with your answer below. Ensure tip labels are clearly visible in the image.

**Question v:** 
What is the unit of branch lengths in this tree? In addition, describe key observations for evolutionary relationships.

**Answer starts:**

Your answer

**Answer ends**


### 1.5 Tree-based alignment method

In this section, we introduce an alternative multiple sequence alignment (MSA) method that uses a phylogenetic tree to guide the alignment process. Unlike traditional progressive alignment methods, tree-based alignment incorporates evolutionary relationships to improve accuracy.

We will use [PRANK](https://ariloytynoja.github.io/prank-msa/docs/prank_installation.html) to perform tree-based alignment. 

Open the terminal and run the following command, using "global.fasta.treefile" as the guide tree:

```bash
prank -d=sequence.fasta -o=treeb -t=global.fasta.treefile -F -showxml
```

* -d=sequence.fasta : Input sequence file.
* -o=treeb : Output file prefix.
* -t=global.fasta.treefile : Uses the previously generated ML tree to guide alignment.
* -F : Keeps gap placement consistent with evolutionary history.
* -showxml : Outputs results in XML format for further analysis.

For more details, visit the webpage [PRANK differences](http://wasabiapp.org/software/prank/prank_differences/) or refer to [their publication](https://academic.oup.com/mbe/article/33/4/1126/2579418).


**Question vi:** 
How does a tree-based alignment method improve accuracy compared to other progressive methods?

**Answer starts:**

Your answer

**Answer ends**


## 2. Phylogenetic analysis with temporal data (3 points)

Please download the [alignment](./data/nz_cluster.fasta) of one of largest SARS-CoV-2 clusters in Aotearoa New Zealand ([Geoghegan et al. 2020](https://www.nature.com/articles/s41467-020-20235-8#MOESM3)). The alignment consists of 81 SARS-CoV-2 genome sequences from infected patients, where the label contains the meta data of each sequence, such as the sample location by DHB, lineage, the collection date, etc. We will employ the maximum likelihood method using iqtree to produce a phylogenetic tree, and apply another software, TempEst, to explore the temporal signal.

Run [iqtree2](http://www.iqtree.org/#download) on the dataset to construct a maximum likelihood tree, using the command `iqtree -s nz_cluster.fasta`.
Please attach the maximum likelihood tree file (e.g., "nz_cluster.treefile") and iqtree log file (e.g., "nz_cluster.log") with the report.

For the detail, please read the online documentation and tutorials of iqtree2.


### 2.1 Maximum likelihood tree

**Question i:** Please visualize the maximum likelihood tree, and attach the image with your answer below (1 point). 

The advanced requirement is to colour tree branches by sample locations (+1 point). 
You write a script to extract the mapping file between taxon names and the locations inside the taxon names. Use it to colour branches. Please submit your script file with this report if you create one. 

**Answer starts:**

Your answer

**Answer ends**

### 2.2 Identify problems


Root? Branch lengths? Not time tree.

**Question ii:** 

**Answer starts:**

Your answer

**Answer ends**



## 3. Investigate temporal signal (5 points)

We will now employ [TempEst](http://tree.bio.ed.ac.uk/software/tempest/) to analyse the temporal signal and 'clock-likeness' of the maximum likelihood tree generated by iqtree2.
TempEst is specially designed for analysing trees that have not been inferred under a molecular-clock assumption to see how valid this assumption may be.
Additionally, it identifies the optimal root of the tree at the position that is likely to be the most compatible with the assumption of the molecular clock.

If you are unsure how to answer the following questions, please refer to the article by [Rambaut et al 2016](https://doi.org/10.1093/ve/vew007).

Launch TempEst and import the maximum likelihood tree file.
Record and familiarize yourself with the statistics displayed in the top left conner of the interface.

Then, select "Parse Date" and replicate the settings shown in the following image to extract years from taxon labels.

![Fig 1: parse date](./figs/ParseDates.png){width="500px"}

<br>

Navigate to the "Tree" tab to view the visualized tree, and proceed to the "Root-to-tip" tab to understand the implications of the regression analysis results

Next, activate the "best-fitting root" option in the top-left corner to root the tree at the position most congruent with the molecular clock hypothesis, utilizing the default "heuristic residual mean squared" function.

Report the differences between two trees according to the guidelines provided below.

### 3.1. Statistical results

Record both statistical results before and after ticking the "best-fitting root" option by text.
Pick up a statistic from them, which you think it is reasonable for this dataset.
Explain their implications, and compare them with the analysis each other.

<br>

**Question i:**

-   Record the statistical outcomes both prior to and subsequent to activating the 'best-fitting root' option by text.
-   Explain the implications of two key statistics, "Slope (rate)" and "X-Intercept (TMRCA)",
-   Compare their impact on the analysis before and after the application of the 'best-fitting' model.

**Answer starts:**

Your answer

**Answer ends**

### 3.2. The "best-fitting root" tree

After activating the "best-fitting root" option, navigate to the "Tree" tab.

<br>

**Question ii:**

-   Provide a screenshot of the "best-fitting root" tree.
-   Briefly (in a few sentences) describe the benefits for analysing this dataset using the "best-fitting root" option comparing with the maximum likelihood method.

**Answer starts:**

Your answer

**Answer ends**

<br>

**Question iii:**

-   Look at both the "best-fitting root" tree and the root-to-tip plot, identify at least two problematic clades or taxa in the tree
-   Explain the indication of the problem by considering its position in the root-to-tip plot.

**Answer starts:**

Your answer

**Answer ends**

### 3.3. Exploring temporal signal

As [Rambaut et al 2016](https://doi.org/10.1093/ve/vew007) demonstrated, regression of root-to-tip genetic distance against sampling time can be used as a simple diagnostic tool for molecular clock models.

Keep the same option in TempEst, navigate to the "Root-to-tip" tab, and answer the following questions.

<br>

**Question iv:** Does this dataset contain enough temporal signal. Why or why not?

Use the number and figure to support your conclusion.

**Answer starts:**

Your answer

**Answer ends**

<br>

**Question v:** How can you improve this analysis to increase the temporal signal in the data? 

**Answer starts:**

Your answer

**Answer ends**


