
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

## Examples

We can wrangle the data using unique variables to perform summary
function and create meaninful visualizations:

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
  group_by(brand) |>
  summarize(mean = mean(price_usd),
            sd = sd(price_usd),
            median = median(price_usd),
            max = max(price_usd),
            min = min(price_usd),
            count = n())
#> # A tibble: 10 × 7
#>    brand        mean    sd median   max   min count
#>    <chr>       <dbl> <dbl>  <dbl> <dbl> <dbl> <int>
#>  1 Adidas      147.  47.8     140   220    25   100
#>  2 Asics       131.  34.0     120   180    70   100
#>  3 Converse     77.6 13.9      75   120    55   100
#>  4 Fila         69.9  6.49     70    95    60    99
#>  5 New Balance 117.  30.5     110   175    80   100
#>  6 Nike        123.  34.1     120   250    85   118
#>  7 Puma        101.  22.4     100   140    65   100
#>  8 Reebok      109.  31.0     120   200    60   100
#>  9 Skechers     71.0 14.7      65   125    50    89
#> 10 Vans         60    9.02     65    70    50   100

library(viridis)
#> Loading required package: viridisLite

ggplot(data = shoelati, mapping = aes(x = price_usd, y = brand, color = brand)) +
  geom_violin() +
  guides(color = "none") +
  scale_color_viridis(discrete = TRUE) +
  labs(title = "How does Price Distribution vary according to Brand",
       x = "Price (USD)",
       y = "Brand") +
  theme(text = element_text(size = 15))
```

<img src="man/figures/README-example-1.png" width="100%" />

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
