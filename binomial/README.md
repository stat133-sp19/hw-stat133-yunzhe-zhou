
------------------------------------------------------------------------

output:

github\_document:

    html_preview: false

------------------------------------------------------------------------

<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

`"binomial"` is a R package that can help you to calculate some basic statistics for binomial distribution, like mean, variance, mode, skewness and kurtosis. Also, you can use this package to build binomial object, show the plot and table for the probability and cumulative distribution. The summary of the funcitons is listed in the following:

-   `bin_mean()` calculate the expectaion of the binomial distribution given trials and probability

-   `bin_variance()` calculate the variance of the binomial distribution given trials and probability

-   `bin_mode()` calculate the mode of the binomial distribution given trials and probability

-   `bin_skewness` calculate the skewness of the binomial distribution given trials and probability

-   `bin_kurtosis` calculate the kurtosis of the binomial distribution given trials and probability

-   `bin_choose` calculate the comnbinations for k successes in n trials of binomial distribution

-   `bin_probability()` calculate the probability for making specific successes in given trials of binomial distribution

-   `bin_distribution()` calculate the probability distribution for making specific successes in given trials of binomial distribution

-   `bin_cumulative()` calculate the cumulative distribution for making specific successes in given trials of binomial distribution

-   `bin_variable()` create a binomial random variable object

-   `plot` generic function to show the histogram of the probability(for `binds` object) and show the cumulative distribution line plot(for `bincum` object)

-   `summary()` generic function to show the summary statistics of `binvar` object

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r

# development version from GitHub:

#install.packages("devtools") 


# install "binomial" (with vignettes)

devtools::install_github("https://github.com/stat133-sp19/hw-stat133-yunzhe-zhou/binomial", build_vignettes = TRUE)
```

Usage
-----

``` r
library(binomial)
```

``` r
# Calculate some basic measures

# Calculate E(X) given X~B(n,p)
expectation=bin_mean(trials=5,prob=0.3)
expectation
#> [1] 1.5
```

``` r
# Calculate Var(X) given X~B(n,p)
variance=bin_variance(trials=5,prob=0.3)
variance
#> [1] 1.05
```

``` r
# Calculate mode of X given X~B(n,p)
mode=bin_mode(trials=5,prob=0.3)
mode
#> [1] 1
```

``` r
# Calculate skewness of X given X~B(n,p)
skewness=bin_skewness(trials=5,prob=0.3)
skewness
#> [1] 0.39036
```

``` r
# Calculate kurtosis of X given X~B(n,p)
kurtosis=bin_skewness(trials=5,prob=0.3)
kurtosis
#> [1] 0.39036
```

``` r
# Calculate $\binom n k$
choose <- bin_choose(n = 10, k = 3)
choose
#> [1] 120
```

``` r
# Calculate the probability when X=k for binomial distribution
probability=bin_probability(success=3,trials=5,prob=0.3)
probability
#> [1] 0.1323
```

``` r
# Create an object of class "binvar"
object=bin_variable(trials=5,prob=0.3)
object
#> "Binomial variable" 
#>  
#> Parameters 
#> -number of trials: 5
#> -prob of success: 0.3
```

``` r
# Show the summary of the binomial distribution
summary(object)
#> "Summary Binomial" 
#> 
#> Parameters 
#> -number of trials: 5
#> -prob of success: 0.3
#> 
#> Measures
#> -mean    :1.5
#> -variance:1.05
#> -mode    :1
#> -skewness:0.390360029179413
#> -kurtosis:-0.247619047619047
```

``` r
# Show the table of the binomial distribution

#Show the table of distribution
dist1=bin_distribution(trials=5,prob=0.3)
dist1
#>   success probability
#> 1       0     0.16807
#> 2       1     0.36015
#> 3       2     0.30870
#> 4       3     0.13230
#> 5       4     0.02835
#> 6       5     0.00243
```

``` r
# Show the table of the cumulative distribution
dist2=bin_cumulative(trials=5,prob=0.3)
dist2
#>   success probability
#> 1       0     0.16807
#> 2       1     0.52822
#> 3       2     0.83692
#> 4       3     0.96922
#> 5       4     0.99757
#> 6       5     1.00000
```

``` r
# Show the plot of the binomial distribution

# show the plot of the disribution
plot(dist1)
```

``` r
# show the plot of the cumulative distribution

plot(dist2)
```
