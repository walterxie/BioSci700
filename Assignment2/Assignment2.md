
# BioSci700 Assignment 2 (15 marks)

Your name (UPI)

## Software

We will use the the following software, please make sure they are ready in your computer.

- [iqtree2](http://www.iqtree.org/#download)
- [BEAST 2.7.3](http://www.beast2.org)
- [TempEst 1.5.3](http://tree.bio.ed.ac.uk/software/tempest/)
- [FigTree 1.4.4](http://tree.bio.ed.ac.uk/software/figtree/) or [ggtree](https://bioconductor.org/packages/release/bioc/html/ggtree.html) or [icytree](https://icytree.org)
- [Tracer 1.7.2](https://github.com/beast-dev/tracer/releases)

## Data

Please download the [Dingue virus data](./Dengue4.nex) data, which is published by [Bennett et al., 2010](https://doi.org/10.1093/molbev/msp285). It consists of 76 samples during the phylodynamics of DENV-4 between 1981 and 1998.

Read the publication, and then make the following analyses. 
Please write one final report for 3 sections to answer all questions, 
and insert the required figures into the report.   
Please submit the related files and outputs with the report together.

## 1. Maximum likelihood tree (2 points)

Use [iqtree2](http://www.iqtree.org/#download) to create the maximum likelihood tree of this dataset. 

### 1.1. What is the "best-fit" model chosen for this data according to the iqtree's report? And what criterion is used for choosing this "best-fit" model?

### 1.2. Plot the maximum likelihood tree. What is the unit of branch lengths in your maximum likelihood tree? 

If you prefer to use a software with GUI, we recommend [FigTree](http://tree.bio.ed.ac.uk/software/figtree/) or [icytree](https://icytree.org). If you prefer R, you can use [ggtree](https://bioconductor.org/packages/release/bioc/html/ggtree.html). 

The maximum likelihood tree file (e.g. "Dengure4.nex.treefile") and iqtree log file (e.g. Dengure4.nex.log) must be attached with the report.


## 2. Investigate the temporal signal (5 points)

Use [TempEst](http://tree.bio.ed.ac.uk/software/tempest/) to investigate the temporal signal at your maximum likelihood tree. Click "Parse Date", change "Order" to `last` and set "Prefix" to `DNF`, 
also select the check-box "Add the following value to each:". Then, click "OK".
This will parse years from taxon labels into the dates.

Now you can click the other tabs, e.g. "Tree", to look at the visualization and result.
Remember this tree is the original tree that you just load.
Then, find the check-box "best-fitting root" on the top-left corner, select it.
It will root the tree at the position that is likely to be the most compatible with the assumption of the molecular clock, using the `heuristic residual mean squared` function (as default).
Click the other tabs, report the differences by the following requirements:

### 2.1. Record statistical results for both trees, the original maximum likelihood tree and the best-fitting root tree, and also explain the implication of these statistical results.

### 2.2. Take the screenshot of the best-fitting root tree in "Tree" tab (you should already plot the original tree in the previous section). Please make sure tip labels are visible. Describe which tree looks more reasonable in term of the sampling dates. Why?

### 2.3. Take screenshots of two root-to-tips plots from both trees. Describe which plot is more reasonable. Why?


## 3. BEAST analysis (8 points)

In this analysis, we will use the Coalescent Bayesian Skyline plot [Drummond, Rambaut, Shapiro, & Pybus, 2005](https://academic.oup.com/mbe/article/22/5/1185/1066885) to infer the phylodynamics of DENV-4. Please make sure to answer all questions numbered by Roman numerals.  

### 3.1. Set up the model through BEAUti and MCMC run using BEAST.

Open BEAUti, click "Import Alignment" from the "File" menu. Then choose the file "Dengue4.nex".
You can see there is one partition available in the "Partitions" panel. It also tells you the number of taxa and sites in the alignment. The alignment can be visualized by a viewer after double-clicking the partition.

Now select the check-box "Use tip dates" in the "Tip Dates" tab. The data are virus and are sampled at different years (so-called "heterochronous"), so keep the default setting "Since some time in the past". Next, click the button "Auto-config", and choose the option to use everything "after first", but replace `_` as `F`, and click "OK". Then, the years will be automatically parsed from the taxa names into the table column "Date (raw value)".

In the "Site Model" tab, specify a HKY with 4 Gamma categories with empirical frequencies for the stationary distribution. Estimate the substitution rate, Gamma shape parameter and kappa.

In the "Clock Model" tab, keep the default of "Strict Clock", but change the starting value of the molecular clock rate to "0.001".

Under the "Priors" tab, choose the "Coalescent Bayesian Skyline" tree prior.
Change the "clockRate" prior from `Uniform` into `Log Normal` and set `M` to `-7` and `S` to `2.5`. You can use the R code `qlnorm(p=c(0.025,0.5,0.975), meanlog=-7, sdlog=2.5)` to display the quantiles.

**i. Explain why Uniform is the "bad" prior to estimate the molecular clock rate? Why Normal prior is also an improper prior here?**

Go to the "View" menu and select "Show initialization panel". Select the panel and click the black triangle icon to expend the setting of "bPopSizes". We change the starting "Value" into `70`.  

In the MCMC tab, set "Chain Length" to `25000000` (25 million), and change the "tracelog" to "Log Every" `5000`, and change the "treelog" to "Log Every" `5000.` Note: we recommend to use the same logging frequencies between the trace log and tree log, since these files will be used to analysis the result. You can change the "screenlog" to "Log Every" `100000`, so BEAST will print less frequently to the screen.

Now save this setup as an XML file (e.g. D4.xml), and run this XML using BEAST 2 **twice** separately by different seeds.

Hint: create 2 sub-directories, and run the XML separately in each directory, to avoid overwrite the log and tree files.

**ii. Describe what are models that you have applied for this analysis.** 

You can use a proper natural language to reduce the content, such as "clock rate prior is LogNormal(m=-7,s=2.5)" (Note: priors are the part of the model)


### 3.2. Analyse results

In the report, summarise the results of your runs, and answers all of the questions below using graphs and figures where appropriate. Please attach a copy of your BEAST XML file, and the resulting output files. Check the convergence of your 2 runs using Tracer. If you are not convinced that the analysis has run for long enough, run it for longer.

**iii. Report the results of important parameters. How can you tell your analysis has run for long enough? Why it'd better to randomly run MCMC multiple times instead of just once?** 

Summarise the sampled trees as a maximum clade credibility tree using "TreeAnnotator" (and visualised in "FigTree" or "IcyTree"), and compare this approach with using "Densitree". 

**iv. What are the strengths and weaknesses of the two summary methods for this analysis?**

Look at the maximum clade credibility tree:

**v. What is the unit of branch lengths in this maximum clade credibility tree? What is the age of the most recent common ancestor for all samples (with HPD interval)? How to interpret this age regarding to this epidemic?**

Use "Tracer" to reconstruct and plot the past population dynamics. Navigate to "Analysis" => "Bayesian Skyline Reconstruction". To get the correct dates in the analysis we should specify the "Age of the youngest tip" to the time when the most recent sample was collected.
Click OK. 

**vi. What is the effective population size? Show the skyline plot, and tell if we can observe any population dynamics through the time?**

### 3.3. Dimesion of effective population sizes

One simple method to improve the above plot is to increase the dimension of effective population sizes.

Launch the BEAUti, and go to "File" menu and click "Load" to load your XML (e.g. D4.xml). This supposes to load all previous settings, click around to make sure they are correct. Then, select the "Initialization" panel, and change the "Dimension" of both "bPopSizes" and "bGroupSizes" from `5` (default) into `10`.
Save the XML to different file (e.g. D4pop10.xml). Create a new directory and run it using BEAST2. This time you can only run once. 
After the run is completed, get the skyline plot from Tracer. 

In addition, repeat this process to create another XML with `20` popSizes and groupSizes, run it again, and get the skyline plot. 

**vii. Compare these 3 skyline plots, and write your discussion.**

For example, how to choose the dimension for the Bayesian skyline analysis? What does the number of groups do? How does this change affect the dynamics of effective population sizes?

**viii. Pick up one plot that you think it is the best, and make your conclusion on the Bayesian skyline analysis at the phylodynamics of DENV-4.**

For example, what can you infer from the changes of effective population sizes through the time?

### Bonus question: 

**Plot 3 skyline in one graph using R ggplot2. Explain if there is any systematic difference.**
