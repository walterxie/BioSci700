## Assignment1 : Alignment and Phylogenetic Reconstruction (15 marks)

Due date: 4th April 2025

Your name (UPI)


## Instruction

Please write a report using this template and save it into the PDF format. 
You can either use [Overleaf](https://www.overleaf.com), or MS Word, or Google Doc, and then export the completed report as a PDF file. The PDF file name must contain your name and UPI.

In your report, please replace the author into your name in the header above, including UPI insider the bracket.
For the content of the report, you need to copy all the questions and the section titles from this template, and then fill in your answers accordingly. 
Please follow the provided instructions carefully to set up the analysis and answer all questions, which are numbered using Roman numerals, such as **Question i:**.
One point for each question, and one bonus point for **clarity** and producing a well-written report.

Your responses to questions should be inside the answer blocks.
Ensure that no answer blocks are overlooked, with the exception of the example provided below.
Substitute 'Your answer' with your actual response to each question, limiting your answers to a maximum of 150 words.
For questions that necessitate a screenshot, please ensure that the image is clear and legible.

**Answer starts:**

Your answer

**Answer ends**

Ensure you answer all questions and submit your report in the PDF format.
Before submitting, please verify that your report opens and displays correctly.
Additionally, it's beneficial to include all relevant figures in your answers, along with the log files and tree files associated with your analysis.
For example, iqtree's tree file (e.g., `*.treefile`) and log file (e.g., `*.log`).

To minimize the size of your submission, consider compressing the files, ensuring to use only the ZIP format for compatibility. Remember to add your name and UPI to the file name, and test if it can be decompressed properly before submission.


## 1. Multiple sequence alignment (MSA) application (4 points)

In this section, we will practise how to use homologous sequences from different species to reconstruct evolutionary relationships. We choose mitochondrial DNA from five species:

Homo sapiens (Human): NC_012920.1
Pan troglodytes (Chimpanzee): NC_001643.1
Canis lupus (Dog): NC_002008.4
Felis catus (Cat): NC_001700.1
Gallus gallus (Chicken): GU261700.1 


### 1.1 Download data 

Please use the above accession numbers to download the sequences from NIH https://www.ncbi.nlm.nih.gov/nuccore/.

You can follow the following steps: 
1. open the web page in a browser;
2. type "NC_012920.1 OR NC_001643.1 OR NC_002008.4 OR NC_001700.1 OR GU261700.1" in the text field;
3. click "Search" button, and select the top five results;
4. click "Send to" and choose "File", then change the format to "FASTA", and click the button "Create file".
5. find the downloaded file mostly named as "sequence.fasta".

Copy the sequences file to your working directory. 
Open it using any text editor, and then simplify the label by searching for every ">".
For example, the 1st line, rename it to "Chicken|GU261700.1" (remove the rest texts in the label).

We will conduct two different alignment method on this dataset and compare the results.


**Question i:** Do you think we should apply the local or global alignment method for studying the  evolutionary history in species level? Why?

**Answer starts:**

Your answer

**Answer ends**


### 1.2 Progressive method

These methods build the alignment step by step, starting from pairwise alignments and progressively adding more sequences.
Here, we will use the software [MAFFT](https://mafft.cbrc.jp/alignment/software/manual/manual.html) to create the global alignment from the downloaded sequences. 

Open the terminal, and use the following command line to create the alignment "global.fasta".

```bash
mafft --maxiterate 1000 --globalpair sequence.fasta > global.fasta
```


### 1.3 Tree-based method

These methods use a phylogenetic tree to guide the alignment process, aligning sequences based on their evolutionary relationships.
Here, we will use another software [PRANK](https://ariloytynoja.github.io/prank-msa/docs/prank_installation.html) to create the tree-based alignment from the downloaded sequences. 

Open the terminal, first, use the following command line to create the guide tree "global.fasta.treefile" using iqtree. Replace "MY_PATH" to the parent folder path containing iqtree.

```bash
/MY_PATH/bin/iqtree2 -s global.fasta
```

Secondly, use the following command line to create the alignment given a guide tree.

```bash
prank -d=sequence.fasta -o=treeb -t=global.fasta.treefile -F -showxml
```

Quickly read the webpage [PRANK differences](http://wasabiapp.org/software/prank/prank_differences/) or [their publication](https://academic.oup.com/mbe/article/33/4/1126/2579418).


**Question ii:** Briefly explain how the tree-based alignment method to provide more accurate alignment compared to other progressive methods.

**Answer starts:**

Your answer

**Answer ends**


### 1.4 Compare results




**Question iii:** 

**Answer starts:**

Your answer

**Answer ends**



## 2. Maximum likelihood tree (5 points)

Please download the [alignment](./data/nz_cluster.fasta) of one of largest SARS-CoV-2 clusters in Aotearoa New Zealand ([Geoghegan et al. 2020](https://www.nature.com/articles/s41467-020-20235-8#MOESM3)). The alignment consists of 81 SARS-CoV-2 genome sequences from infected patients, where the label contains the meta data of each sequence, such as the sample location by DHB, lineage, the collection date, etc. We will employ the maximum likelihood method using iqtree to produce a phylogenetic tree, and apply another software, TempEst, to explore the temporal signal.

Run [iqtree2](http://www.iqtree.org/#download) on the dataset to construct a maximum likelihood tree, using the command `iqtree -s nz_cluster.fasta`.
Please attach the maximum likelihood tree file (e.g., "nz_cluster.treefile") and iqtree log file (e.g., "nz_cluster.log") with the report.

For the detail, please read the online documentation and tutorials of iqtree2.

### 2.1 Identify the "best-fit" model

Iqtree2 offers a wide range of DNA substitution models.
Upon execution, it leverages ModelFinder to identify the optimal model for your data, subsequently building the tree using this model.

<br>

**Question i:** By referring to the iqtree log file (e.g., "nz_cluster.log"), what was the "best-fit" substitution model? What was its log-likelihood?
Please provide a brief, yet precise, description of the selected model.

**Answer starts:**

Your answer

**Answer ends**

### 2.2 Results

**Question ii:** Please visualize the maximum likelihood tree, and attach the image with your answer below. The branches are preferred to be coloured by sample locations (0.5 point). The tip labels must be visible.
What are the units of branch length in this maximum likelihood tree?

**Answer starts:**

Your answer

**Answer ends**


## 3. Investigate temporal signal (6 points)

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


