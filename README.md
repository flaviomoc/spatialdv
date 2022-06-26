
# spatialdv

<!-- badges: start -->
<!-- badges: end -->

The goal of spatialdv is to calculate diversity patterns for spatial data

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
## basic example code
require(terra)
set.seed(100)
ref <- rast(array(sample(c(rep(1, 750), rep(0, 250))), dim = c(10, 10, 10)))
fut <- rast(array(sample(c(rep(1, 300), rep(0, 700))), dim = c(10, 10, 10)))
spatialdv(ref, fut, "beta")
```

