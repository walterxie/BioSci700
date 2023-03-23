
Please rename the R markdown file and add your name and UPI into the file name, 
and then open the R markdown file, replace the author into your name in the header, 
including UPI insider the bracket.

This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook.
It can be edited by [RStudio](https://posit.co/download/rstudio-desktop/). 
User guide is available at [bookdown.org](https://bookdown.org/yihui/rmarkdown/). 

**Note:** in question 1 and 2, some code has been given in order to define the input and output. 
Your code should be implemented between two comments "### your code here" and "### your code finished above". Please make sure that you do not miss any blocks, except for the example below:

```
# your code here
# ...
# your code finished above
```

In question 3, please replace the "Your answer" in the example block below into your actual answer of that quetion.

```
Your answer
```


## Download

  i. [R examples](RExamples.html)

  ii. [Assignment 1 - template](Assignment1/Assignment1Template.Rmd), [ABCD.fasta](Assignment1/ABCD.fasta), [Dengue4.env.nex](Assignment1/Dengue4.env.nex).

Requirements:

- R 4.2.2
- RStudio
- R libraries: "ape", "phangorn", "phytools", "tidyverse", and "Biostrings".  
- [iqtree2](http://www.iqtree.org/#download)

You need to follow the [installation instruction](https://bioconductor.org/packages/release/bioc/html/Biostrings.html)
to use "BiocManager" to install "Biostrings".


  iii. [Assignment 2](https://walterxie.github.io/BioSci700/Assignment2/Assignment2.html)

Please submit the report in PDF format and include all necessary log files and tree files.

Requirements:

- [iqtree2](http://www.iqtree.org/#download)
- [TempEst 1.5.3](http://tree.bio.ed.ac.uk/software/tempest/)
- [BEAST 2.7.4](http://www.beast2.org)
- [FigTree 1.4.4](http://tree.bio.ed.ac.uk/software/figtree/) or [ggtree](https://bioconductor.org/packages/release/bioc/html/ggtree.html) or [icytree](https://icytree.org)
- [Tracer 1.7.2](https://github.com/beast-dev/tracer/releases)

### Mac version issues

Note that the Mac version of TempEst and FigTree may have an issue 
where they incorrectly prompt for the installation of Java 1.6. 
This is a known bug and does not affect the functionality of the programs. 
To run FigTree or TempEst, you can simply extract and launch the executable version
(e.g., FigTree_v1.4.4.tgz) without needing to install Java 1.6 separately.

To start FigTree, run the following command in the terminal: 

```bash
cd /Applications/FigTree1.4.4
bin/figtree 
```

If `figtree` is not executable in your machine, 
run the following command in the terminal before starting FigTree: 

```bash
chmod u+x bin/figtree
```


## Useful links

- [RStudio download](https://posit.co/download/rstudio-desktop/)

- [bookdown.org](https://bookdown.org/yihui/rmarkdown/) 

- [R Markdown](https://rmarkdown.rstudio.com/lesson-1.html)