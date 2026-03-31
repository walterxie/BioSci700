# BioSci700 Lab 2: Phylogenetic inference

**Temporal Signal, Molecular Clocks, and Population Dynamics in Dengue Virus (DENV-4)**

**Author:** Your Name (UPI)

---


# Section 1: Maximum Likelihood Tree (7 points)

**Question 1.1 (2 pts)**

State the best-fit model reported in the IQ-TREE3 log and also name the criterion used to select the model. Read the IQ-TREE3 documentation and explain what each component of the model name represents.

```
Your answer here
```

**Question 1.2 (2 pts)**

According to the best-fit model selected by IQ-TREE3, identify which part of the model handles rate heterogeneity among sites. Briefly describe how this site model is an improvement over a traditional alternative (name the alternative model as well).

```
Your answer here
```

**Question 1.3 (1 pt)**

Visualise the maximum likelihood tree (e.g. Dengure4.treefile) using [FigTree](http://tree.bio.ed.ac.uk/software/figtree/) or [IcyTree](https://icytree.org), or [ggtree](https://bioconductor.org/packages/release/bioc/html/ggtree.html).

**Insert your tree figure below.**

---

**Question 1.4 (2 pts)**

Using this maximum likelihood tree as an example, briefly explain the rate-time non-identifiability problem and why it prevents a direct interpretation of branch lengths as evolutionary time.

```
Your answer here
```

---

# Section 2: Temporal Signal (5 points)

**Question 2.1 (1 pt)**

Before enabling the best-fitting root, record the statistics from the root-to-tip regression panel for the **original ML root** in the table below. Then enable the best-fitting root and record the updated statistics.

Insert a screenshot of the **root-to-tip regression plot** after selecting the best-fitting root below.

**Insert your figure here**

Record all four statistics for **both** rootings in the table below.

<div>
| Statistic | Original ML Root | Best-fitting Root |
|-----------|:----------------:|:-----------------:|
| Slope | | |
| X-Intercept | | |
| Correlation coefficient | | |
| *R*² | | |
</div>

---

**Question 2.2 (2 pts)**

Interpret the implications of these four statistics. Conclude whether this dataset favours the strict molecular clock or relaxed clock model, and why.

```
Your answer here
```

---

**Question 2.3 (2 pts)**

Insert screenshots of the tree displayed in the "Tree" tab for both the original ML root and the best-fitting root, ensuring tip labels are visible. Briefly describe the key structural difference between these two trees.

```
Your answer here
```

---

# Section 3: BEAST 2 Phylodynamic Analysis (12 points)

## Setting up the model in BEAUti

**Question 3.1 (2 pts)**

In BEAUti, the default prior for `clockRate` is `Uniform(0, ∞)`. You have replaced this with a `LogNormal(M = −7.15, S = 0.25)` prior. Think about what a Bayesian prior represents biologically, and answer the questions below:

- Why is a Uniform prior problematic for a rate parameter like `clockRate`?
- Use the `qlnorm()` output from the setup to describe what the LogNormal prior implies biologically, namely, what range of clock rates does it consider plausible for DENV-4?
- A Normal distribution is also informative. Why is it nonetheless unsuitable for a rate parameter, and what property of the LogNormal makes it more appropriate?

```
Your answer here
```

---

## Running and diagnosing the BEAST analysis

**Question 3.2 (2 pts)**

- Insert a screenshot of the Tracer ESS summary. Report the posterior mean and 95% HPD for the clock rate and tree height. Did all parameters meet the minimum ESS threshold commonly used in Bayesian phylogenetics? If not, which did not, and what would you do to address this?
- You ran a single BEAST chain. What would be the advantage of running a second independent chain, and how would you use it to verify that both chains converged to the same posterior distribution?

```
Your answer here
```

---

## The relative rates

**Question 3.3 (2 pts)**

- Insert a screenshot of the marginal densities.
- Compute the absolute rate of the 1st codon position and show your calculation.
- Considering the biological meaning of each partition, draw a conclusion about codon-specific rate heterogeneity in DENV-4 based on your results.

```
Your answer here
```

---

## Summarising trees

**Question 3.4 (2 pts)**

- What are the units of branch lengths in the MAP tree?
- Report the estimated age of the most recent common ancestor (tMRCA) of all samples and its 95% HPD interval.
- Interpret this estimate in the context of the DENV-4 epidemic history.

```
Your answer here
```

---

## Bayesian Skyline reconstruction

**Question 3.5 (1 pt)**

What is the biological meaning of effective population size in this viral analysis?

```
Your answer here
```

**Question 3.6 (1 pt)**

Insert your Bayesian Skyline plot from the default analysis (dimension = 5). Describe any population dynamics you can observe: did the effective population size (Ne) increase, decrease, or remain stable over the sampling period?

```
Your answer here
```

---

**Question 3.7 (1 pt)**

Compare your Bayesian Skyline plot with Fig. 3 in [Bennett et al. (2010)](https://doi.org/10.1093/molbev/msp285) in terms of the reconstructed Ne trajectory, temporal resolution, and credible interval width. Which result is more informative, and what specific change to the model setting could bring the less informative result closer to the better one?

```
Your answer here
```

---

**Question 3.8 (2 pts + 1 bonus)**

Write a concise methods-and-results summary of your BEAST 2 analysis, in the style of a brief research summary. Your summary should cover:

- The models applied and the rationale for key choices (e.g., substitution model, clock model, tree prior)
- The interpretation of key estimated parameters (e.g., clock rate, tMRCA) in the context of DENV-4 biology
- What the Bayesian Skyline plot reveals about DENV-4 population dynamics between 1981 and 1998

**Bonus:** Identify one limitation of your analysis and propose a concrete improvement.

```
Your answer here
```

---

# Submission Checklist

Before submitting, confirm each item below:

- File is renamed with your name and student ID: `Lab2_YourName_UPI`
- All questions are answered with clear and thoughtful responses
- All required screenshots and figures are embedded in the document
- All required output files listed below are included in the submission

**Required output files:**

> **Note:** The table below lists software output files only. Screenshots and figures required by individual questions should be embedded directly in your report document and are not listed here.

| File | Section |
|------|---------|
| `Dengure4.treefile` | 1 |
| `Dengure4.log` (IQ-TREE log) | 1 |
| `Dengure4.iqtree` | 1 |
| `Dengue4.xml` | 3 |
| `Dengue4.log` (BEAST trace log) | 3 |
| `Dengue4.trees` (BEAST tree log) | 3 |
| MAP tree file (`Dengue4.map.tree`) | 3 |

## Grading Rubric

| Section | Component | Points |
|---------|-----------|--------|
| **Section 1** | Question 1.1 — best-fit model name and selection criterion | 2 |
| | Question 1.2 — rate heterogeneity component and comparison with alternative model | 2 |
| | Question 1.3 — ML tree figure correctly visualised with readable labels | 1 |
| | Question 1.4 — rate-time non-identifiability | 2 |
| **Section 1 total** | | **7** |
| **Section 2** | Question 2.1 — root-to-tip regression screenshot and statistics table | 1 |
| | Question 2.2 — interpretation of statistics and clock model conclusion | 2 |
| | Question 2.3 — tree comparison (original vs best-fitting root) | 2 |
| **Section 2 total** | | **5** |
| **Section 3** | Question 3.1 — prior choice justification (Uniform vs LogNormal vs Normal) | 2 |
| | Question 3.2 — MCMC diagnostics, ESS, and convergence | 2 |
| | Question 3.3 — relative rates: marginal densities and codon heterogeneity | 2 |
| | Question 3.4 — MAP tree: branch length units and tMRCA interpretation | 2 |
| | Question 3.5 — biological meaning of effective population size | 1 |
| | Question 3.6 — Bayesian Skyline plot and population dynamics | 1 |
| | Question 3.7 — comparison with Bennett et al. (2010) Fig. 3 | 1 |
| | Question 3.8 — methods-and-results summary (+ 1 bonus) | 2 |
| **Section 3 total** | | **12** (+1 bonus) |
| **Presentation** | Overall writing clarity, figure quality, and document formatting | 1 |
| **Grand total** | | **25** (+1 bonus) |