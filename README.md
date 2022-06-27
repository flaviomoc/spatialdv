
# spatialdv

<!-- badges: start -->
<!-- badges: end -->

The goal of spatialdv is to calculate diversity patterns for spatial data. It also has a function called spatialgn to calculate ecological generalization of species traits.

## Installation

You can install the development version of spatialdv from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("flaviomoc/spatialdv")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(spatialdv)
## basic example code for spatialdv function
ref <- terra::rast(array(sample(c(rep(1, 750), rep(0, 250))), dim = c(10, 10, 10)))
fut <- terra::rast(array(sample(c(rep(1, 300), rep(0, 700))), dim = c(10, 10, 10)))
spatialdv(ref, fut, "beta")

## basic example code for spatialgn function
mass <- runif(10, .5, 2)
elev <- sample(500:1000, 10)
ref <- terra::rast(array(sample(c(rep(1, 750), rep(0, 250))), dim = c(10, 10, 10)))
traits <- as.data.frame(cbind(mass, elev))
rownames(traits) <- paste0("sp", 1:nrow(traits))
spatialgn(ref, traits, "mass")
spatialgn(ref, traits, "elev")
```
