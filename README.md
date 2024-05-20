# webr-checker
Using javascript to check webr output for learnr-style feedback

# Example

See it in action [here](https://jmclawson.net/misc/webr-checker/01-start.html). Source available [here](01-start.qmd).

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

4. After a code chunk that should be checked, add the following to insert a code button and feedback. The "solution" to the code chunk should get passed to the `check_button()` function, as shown here:

````
```{webr-r}
#| label: vectors2a
kitten_weight <- 2, 4 5, 3,

kitten_weight
```

```{r}
#| echo: false
#| output: asis
check_button("2 4 5 3")
```
````

# Limitations
There are many. Right now, it only verifies a string found in the results window, and it probably doesn't work for multiple lines. It might be worth looking into converting an R object to Javascript for better comparison. That's covered in the WebR documentation [here](https://docs.r-wasm.org/webr/latest/convert-r-to-js.html).

