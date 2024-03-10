
# BIOSCI 700: Phylogenetics

## Assignment 1

  1. [Assignment 1 - template](Assignment1/Assignment1Template.Rmd), 
  2. [RSV2.nex](Assignment1/RSV2.nex), 
  3. [tree2t.png](Assignment1/tree2t.png).

Please follow the instruction to complete the assignment. 
Submit your original .Rmd file with the generated HTML file, 
including the downloaded alignment and figures, and also the generated tree files and figures.

To generate HTML from .Rmd file, you can go to "Knit options", 
and click the menu item [Knit to HTML](./Knit2HTML.png).


## Assignment 2

  coming ...


## Useful links

- [R examples](RExamples.html)

- [Math in R markdown](https://rmd4sci.njtierney.com/math)

- [More R markdown](https://bookdown.org/yihui/rmarkdown/)

- [IcyTree](https://icytree.org)

- [FigTree](https://github.com/rambaut/figtree/releases)


## 3rd party software issues

### Resize a image in a .Rmd file in RStudio

`![Q2](./tree2t.png)` may result in a large size when creating HTML from the .Rmd file. 
You may consider using the following code to replace it, which allows you to add a resized image: 

`<img src="tree2t.png" alt="Q2" width="200"/>`


### Mac version issues

Note that the Mac version of **TempEst** and **FigTree** may have an issue 
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
