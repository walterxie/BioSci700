# BIOSCI 700: Phylogenetics

## Assignment 1

[Assignment 1](Lab1/Lab1.html) and [Assignment 1 Notebook](Lab1/Lab1.Rmd)

### Required Software

- [R >4.2.x](https://cran.r-project.org) and [R studio](https://posit.co/download/rstudio-desktop/);

- [MAFFT](https://mafft.cbrc.jp/alignment/software/) 

Required R packages:

- Download and run a installation script 
[Setup.R](https://raw.githubusercontent.com/walterxie/BioSci700/refs/heads/main/Lab1/Setup.R)
to install the required R packages.
Use `library()` to check if the installation is successful.

### Required data

- [exampleAA.fasta](Lab1/exampleAA.fasta)

- [Dengue4.env.nex](Lab1/Dengue4.env.nex)


## Useful links

- [R examples](RExamples.html) or [R tutorial](https://www.w3schools.com/r/), and [R tutorial for
vectorisation](https://sahirbhatnagar.com/biosR/vectorization-apply-and-for-loops.html)

- [Math in R markdown](https://rmd4sci.njtierney.com/math)

- [More R markdown](https://bookdown.org/yihui/rmarkdown/)

- [IcyTree](https://icytree.org)

- [FigTree](https://github.com/rambaut/figtree/releases)

- [BEAST 2](http://www.beast2.org)


## 3rd party software issues

### Resize a image in a .Rmd file in RStudio

`![Q2](./tree2t.png)` may result in a large size when creating HTML from the .Rmd file. You may
consider using the following code to replace it, which allows you to add a resized image:

`<img src="tree2t.png" alt="Q2" width="200"/>`


### Mac version issues

1. Cannot be opened

The latest version of macOS has implemented stricter security protocols for opening downloaded
software. As a result, you may encounter the following error on a Mac:

<img src="MacIqtree2NotOpened.png" alt="Cannotbeopened" width="300"/>

To resolve the issue, navigate to "System Settings" => "Privacy & Security" => "Security" on your
Mac, and select "Allow Anyway" for the software in question.

<img src="MacAllowIqtree2.png" alt="MacAllowIqtree2" width="500"/>

Afterwards, relaunch the application (for instance, iqtree2). When prompted, click "Open" in the
pop-up window to proceed.

<img src="MacRunIqtree2Open.png" alt="MacRunIqtree2Open" width="300"/>


{:start="2"} 
2. Incorrectly prompt for the installation of Java 1.6

Note that the Mac version of **TempEst** and **FigTree** may have an issue where they incorrectly
prompt for the installation of Java 1.6. This is a known bug and does not affect the functionality
of the programs. To run FigTree or TempEst, you can simply extract and launch the executable version
(e.g., FigTree_v1.4.4.tgz) without needing to install Java 1.6 separately.

To start FigTree, run the following command in the terminal:

```bash cd /Applications/FigTree1.4.4 bin/figtree ```

If `figtree` is not executable in your machine, run the following command in the terminal before
starting FigTree:

```bash chmod u+x bin/figtree ```




