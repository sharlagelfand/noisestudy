
``` r
knitr::opts_chunk$set(cache = TRUE)

library(prismatic)
library(dplyr, warn.conflicts = FALSE)
```

    ## Warning: package 'dplyr' was built under R version 4.1.2

``` r
library(ambient)
library(tidyr)
library(ggplot2)
```

    ## Warning: package 'ggplot2' was built under R version 4.1.2

``` r
source(here::here("generate_noise.R"))

colours <- c(
  red = "#F14A14",
  orange = "#FF9316",
  yellow = "#FBC21B",
  darkpink = "#F65A82",
  lightpink = "#FD96B8",
  darkblue = "#4A3DFB",
  lightblue = "#8DD8F8",
  purple = "#B38AD9",
  lightgreen = "#C1F213"
)

grid <- crossing(x = -100:100, y = -100:100)

shift_colour_from_noise <- function(data, colour = colours[["red"]], shift = 0.25) {
  grid_colours <- clr_darken(rep(colour, nrow(data)), shift = data$noise * shift, "HSL")

  data$colour <- grid_colours

  data
}

plot_grid <- function(data) {
  ggplot() +
    geom_point(data = data, aes(x = x, y = y, colour = colour), shape = 15, size = 0.75) +
    scale_colour_identity() +
    coord_fixed() +
    theme_void()
}

plot_noisy_colour <- function(data, noise, frequency, seed = 1234, colour = colours[["red"]], normalise = FALSE) {
  data %>%
    generate_noise(noise, frequency, seed, normalise) %>%
    shift_colour_from_noise(colour) %>%
    plot_grid()
}
```

# Random sample

``` r
set.seed(1234)

grid %>%
  rowwise() %>%
  mutate(noise = runif(1, -1, 1)) %>%
  ungroup() %>%
  shift_colour_from_noise() %>%
  plot_grid()
```

![](README_files/figure-gfm/sample-1.png)<!-- -->

# Cubic

``` r
grid %>%
  plot_noisy_colour("cubic", 1)
```

![](README_files/figure-gfm/cubic-1.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("cubic", 0.5)
```

![](README_files/figure-gfm/cubic-2.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("cubic", 0.25)
```

![](README_files/figure-gfm/cubic-3.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("cubic", 0.1)
```

![](README_files/figure-gfm/cubic-4.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("cubic", 0.05)
```

![](README_files/figure-gfm/cubic-5.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("cubic", 0.01)
```

![](README_files/figure-gfm/cubic-6.png)<!-- -->

# Perlin

``` r
grid %>%
  plot_noisy_colour("perlin", 0.99)
```

![](README_files/figure-gfm/perlin-1.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("perlin", 0.5)
```

![](README_files/figure-gfm/perlin-2.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("perlin", 0.25)
```

![](README_files/figure-gfm/perlin-3.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("perlin", 0.1)
```

![](README_files/figure-gfm/perlin-4.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("perlin", 0.05)
```

![](README_files/figure-gfm/perlin-5.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("perlin", 0.01)
```

![](README_files/figure-gfm/perlin-6.png)<!-- -->

# Simplex

``` r
grid %>%
  plot_noisy_colour("simplex", 1)
```

![](README_files/figure-gfm/simplex-1.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("simplex", 0.5)
```

![](README_files/figure-gfm/simplex-2.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("simplex", 0.25)
```

![](README_files/figure-gfm/simplex-3.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("simplex", 0.1)
```

![](README_files/figure-gfm/simplex-4.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("simplex", 0.05)
```

![](README_files/figure-gfm/simplex-5.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("simplex", 0.01)
```

![](README_files/figure-gfm/simplex-6.png)<!-- -->

# Spheres

``` r
grid %>%
  plot_noisy_colour("spheres", 1)
```

![](README_files/figure-gfm/spheres-1.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("spheres", 0.5)
```

![](README_files/figure-gfm/spheres-2.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("spheres", 0.25)
```

![](README_files/figure-gfm/spheres-3.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("spheres", 0.1)
```

![](README_files/figure-gfm/spheres-4.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("spheres", 0.05)
```

![](README_files/figure-gfm/spheres-5.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("spheres", 0.01)
```

![](README_files/figure-gfm/spheres-6.png)<!-- -->

# Waves

``` r
grid %>%
  plot_noisy_colour("waves", 1)
```

![](README_files/figure-gfm/waves-1.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("waves", 0.5)
```

![](README_files/figure-gfm/waves-2.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("waves", 0.25)
```

![](README_files/figure-gfm/waves-3.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("waves", 0.1)
```

![](README_files/figure-gfm/waves-4.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("waves", 0.05)
```

![](README_files/figure-gfm/waves-5.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("waves", 0.01)
```

![](README_files/figure-gfm/waves-6.png)<!-- -->

## Waves but in a way I figured out

``` r
waves_grid <- crossing(
  x = seq(4800, 4800 + 400, by = 0.5),
  y = seq(8200, 8200 + 400, by = 0.5)
)

original_colour <- "#33810b"
darker_version <- prismatic::clr_darken(original_colour, shift = 0.25, "HSL")
lighter_version <- original_colour %>%
  prismatic::clr_darken(-0.75, "HSL") %>%
  prismatic::clr_desaturate(0.25)

palette <- colorRampPalette(c(lighter_version, darker_version))(80)

option_from_noise <- function(data, options) {
  data %>%
    # bin into groups and choose colour from there
    dplyr::mutate(
      option_number = dplyr::ntile(noise, length(options)),
      option = options[option_number]
    )
}

waves_grid %>%
  generate_noise("waves", 0.75, seed = 75, normalise = FALSE) %>%
  option_from_noise(palette) %>%
  ggplot() +
  geom_tile(aes(x = x, y = y, width = 0.5, height = 0.5, fill = option)) +
  scale_fill_identity() +
  theme_void() +
  coord_fixed()
```

![](README_files/figure-gfm/fabric-waves-1.png)<!-- -->

# White

``` r
grid %>%
  plot_noisy_colour("white", 0.99)
```

![](README_files/figure-gfm/white-1.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("white", 0.5)
```

![](README_files/figure-gfm/white-2.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("white", 0.25)
```

![](README_files/figure-gfm/white-3.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("white", 0.1)
```

![](README_files/figure-gfm/white-4.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("white", 0.05)
```

![](README_files/figure-gfm/white-5.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("white", 0.01)
```

![](README_files/figure-gfm/white-6.png)<!-- -->

# Worley

``` r
grid %>%
  plot_noisy_colour("worley", 1)
```

![](README_files/figure-gfm/worley-1.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("worley", 0.5)
```

![](README_files/figure-gfm/worley-2.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("worley", 0.25)
```

![](README_files/figure-gfm/worley-3.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("worley", 0.1)
```

![](README_files/figure-gfm/worley-4.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("worley", 0.05)
```

![](README_files/figure-gfm/worley-5.png)<!-- -->

``` r
grid %>%
  plot_noisy_colour("worley", 0.01)
```

![](README_files/figure-gfm/worley-6.png)<!-- -->
