
  i. [R examples](RExamples.html)

  ii. [Assignment 1 - template](Assignment1/Assignment1Template.Rmd), [ABCD.fasta](Assignment1/ABCD.fasta), [Dengue4.env.nex](Assignment1/Dengue4.env.nex).

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
