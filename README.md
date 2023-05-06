
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shoelati

<!-- badges: start -->
<!-- badges: end -->

shoelati is an extension of ggplot2 which makes data representations
more accessible, conclusive, and fun. This package uses packages such as
viridis to make the visualizations specifically more reacheable for all
individauls. It also performs commmon summary functions to find trends.
Finally, it demonstrates how we can use geoms such as emojis to make
more fun graphs.

## Installation

You can install the development version of shoelati from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("harvard-stat108s23/project2-group18")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(shoelati)
library(tidyverse)
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.0     ✔ readr     2.1.4
#> ✔ forcats   1.0.0     ✔ stringr   1.5.0
#> ✔ ggplot2   3.4.1     ✔ tibble    3.1.8
#> ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
#> ✔ purrr     1.0.1     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the ]8;;http://conflicted.r-lib.org/conflicted package]8;; to force all conflicts to become errors

shoelati |>
  count(brand)
#> # A tibble: 10 × 2
#>    brand           n
#>    <chr>       <int>
#>  1 Adidas        100
#>  2 Asics         100
#>  3 Converse      100
#>  4 Fila           99
#>  5 New Balance   100
#>  6 Nike          118
#>  7 Puma          100
#>  8 Reebok        100
#>  9 Skechers       89
#> 10 Vans          100

shoelati |>
  count(brand, general_type)
#> # A tibble: 30 × 3
#>    brand    general_type     n
#>    <chr>    <chr>        <int>
#>  1 Adidas   everyday        56
#>  2 Adidas   fashion          8
#>  3 Adidas   slides           3
#>  4 Adidas   work-out        33
#>  5 Asics    everyday         2
#>  6 Asics    trail            3
#>  7 Asics    work-out        95
#>  8 Converse everyday        89
#>  9 Converse skates           4
#> 10 Converse work-out         7
#> # … with 20 more rows
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
