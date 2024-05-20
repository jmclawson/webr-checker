# webr-checker
Using javascript to check webr output for learnr-style feedback

# Get started

1.  Follow instructions to use the [web-R extension](https://github.com/coatless/quarto-webr) for Quarto.
2.  Include the Javascript file [checker.js](checker.js) and the R script [checker.R](checker.R) in the same directory as your Quarto file.
3.  Start the Quarto file with something that looks like the following:

````
---
title: "My WebR Demo"
format: html
engine: knitr
filters:                         
  - webr  
include-in-header:
  file: checker.js
---

```{r}
#| include: false
source("checker.R")
```
````

4. After a code chunk that should be checked, add the following to insert a code button and feedback. The "solution" to the code chunk should get passed to the `check_button()` function:

````
```{r}
#| echo: false
#| output: asis
check_button(1803)
```
````
