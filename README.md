
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hot.dots

<!-- badges: start -->

<!-- badges: end -->

This paackage provides the code used in Fabre et al 2020 to calculate
per-landmark rate and variance

## Installation

You can install the development version of hot.dots from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("rnfelice/hot.dots")
```

## Example

This is a basic example of how to use these functions

``` r
library(hot.dots)
## Import the 3d morphometric data
my.shapes <- read.csv("./shapedata.csv",row.names = 1)
my.shapes <- array.specs(my.shapes,p =  (ncol(my.shapes)/3), k = 3)
# Import the phylogeny
phy1 <- read.nexus("./phy.nex")
#calculate per landmark rates and variance
my.rates <- per_lm_rates(shape.data = my.shapes, phy = phy1)
my.variances <- per_lm_variance(shape.data = my.shapes)
```

The log10-transformed rate and variance can be plotted on surfaces using
the rgl and Rvcg packages

``` r
library(rgl)
library(Rvcg)
#import the mesh file that corresponds to specimen 1 in the `my.shapes` array
mesh1 <- vcgImport("./salamandermesh.ply")
shade3d(mesh1, col = "white")
spheres3d(my.shapes[,,1], col = my.rates$Rate_Colors)
title3d("Per Landmark Rates")
open3d()
mesh1 <- vcgImport("./salamandermesh.ply")
shade3d(mesh1, col = "white")
spheres3d(my.shapes[,,1], col = my.variances$Variance_Colors)
title3d("Per Landmark Disparity")
```
