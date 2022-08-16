    library(tidyr)
    library(dplyr)

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    library(ggplot2)
    library(ambient)

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

    grid <- crossing(x = 1:30, y = 1:30)

    plot_grid <- function(data) {
      data %>%
        ggplot() +
        geom_tile(aes(x = x, y = y, fill = colour, width = 0.9, height = 0.9)) +
        scale_fill_identity() +
        coord_fixed() +
        theme_void()
    }

    colour_from_noise <- function(data) {
      data %>%
        # bin into groups and choose colour from there
        mutate(
          colour = ntile(noise, length(colours)),
          colour = colours[colour]
        )
    }

# Random sample

    set.seed(1234)

    grid %>%
      rowwise() %>%
      mutate(colour = sample(colours, 1)) %>%
      ungroup() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-2-1.png)

# Cubic

    grid %>%
      mutate(noise = gen_cubic(x, y, seed = 1234)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-3-1.png)

    grid %>%
      mutate(noise = gen_cubic(x, y, seed = 1234, frequency = 0.5)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-3-2.png)

    grid %>%
      mutate(noise = gen_cubic(x, y, seed = 1234, frequency = 0.2)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-3-3.png)

    grid %>%
      mutate(noise = gen_cubic(x, y, seed = 1234, frequency = 0.1)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-3-4.png)

# Perlin

    grid %>%
      mutate(noise = gen_perlin(x, y, seed = 1234, frequency = 0.95)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-4-1.png)

    grid %>%
      mutate(noise = gen_perlin(x, y, seed = 1234, frequency = 0.5)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-4-2.png)

    grid %>%
      mutate(noise = gen_perlin(x, y, seed = 1234, frequency = 0.4)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-4-3.png)

    grid %>%
      mutate(noise = gen_perlin(x, y, seed = 1234, frequency = 0.25)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-4-4.png)

    grid %>%
      mutate(noise = gen_perlin(x, y, seed = 1234, frequency = 0.2)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-4-5.png)

    grid %>%
      mutate(noise = gen_perlin(x, y, seed = 1234, frequency = 0.15)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-4-6.png)

    grid %>%
      mutate(noise = gen_perlin(x, y, seed = 1234, frequency = 0.1)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-4-7.png)

    grid %>%
      mutate(noise = gen_perlin(x, y, seed = 1234, frequency = 0.05)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-4-8.png)

    grid %>%
      mutate(noise = gen_perlin(x, y, seed = 1234, frequency = 0.01)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-4-9.png)

    grid %>%
      mutate(noise = gen_perlin(x, y, seed = 1234, frequency = 0.001)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-4-10.png)

# Simplex

    grid %>%
      mutate(noise = gen_simplex(x, y, seed = 1234, frequency = 1)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-5-1.png)

    grid %>%
      mutate(noise = gen_simplex(x, y, seed = 1234, frequency = 0.5)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-5-2.png)

    grid %>%
      mutate(noise = gen_simplex(x, y, seed = 1234, frequency = 0.25)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-5-3.png)

    grid %>%
      mutate(noise = gen_simplex(x, y, seed = 1234, frequency = 0.1)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-5-4.png)

    grid %>%
      mutate(noise = gen_simplex(x, y, seed = 1234, frequency = 0.075)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-5-5.png)

    grid %>%
      mutate(noise = gen_simplex(x, y, seed = 1234, frequency = 0.05)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-5-6.png)

    grid %>%
      mutate(noise = gen_simplex(x, y, seed = 1234, frequency = 0.01)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-5-7.png)

# Spheres

    grid %>%
      mutate(noise = gen_spheres(x, y, seed = 1234, frequency = 1)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-6-1.png)

    grid %>%
      mutate(noise = gen_spheres(x, y, seed = 1234, frequency = 0.75)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-6-2.png)

    grid %>%
      mutate(noise = gen_spheres(x, y, seed = 1234, frequency = 0.5)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-6-3.png)

    grid %>%
      mutate(noise = gen_spheres(x, y, seed = 1234, frequency = 0.25)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-6-4.png)

    grid %>%
      mutate(noise = gen_spheres(x, y, seed = 1234, frequency = 0.1)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-6-5.png)

    grid %>%
      mutate(noise = gen_spheres(x, y, seed = 1234, frequency = 0.075)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-6-6.png)

    grid %>%
      mutate(noise = gen_spheres(x, y, seed = 1234, frequency = 0.05)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-6-7.png)

    grid %>%
      mutate(noise = gen_spheres(x, y, seed = 1234, frequency = 0.01)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-6-8.png)

# Waves

    grid %>%
      mutate(noise = gen_waves(x, y, seed = 1234, frequency = 1)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-7-1.png)

    grid %>%
      mutate(noise = gen_waves(x, y, seed = 1234, frequency = 0.75)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-7-2.png)

    grid %>%
      mutate(noise = gen_waves(x, y, seed = 1234, frequency = 0.5)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-7-3.png)

    grid %>%
      mutate(noise = gen_waves(x, y, seed = 1234, frequency = 0.25)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-7-4.png)

    grid %>%
      mutate(noise = gen_waves(x, y, seed = 1234, frequency = 0.1)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-7-5.png)

    grid %>%
      mutate(noise = gen_waves(x, y, seed = 1234, frequency = 0.075)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-7-6.png)

    grid %>%
      mutate(noise = gen_waves(x, y, seed = 1234, frequency = 0.05)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-7-7.png)

    grid %>%
      mutate(noise = gen_waves(x, y, seed = 1234, frequency = 0.01)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-7-8.png)

# White

    grid %>%
      mutate(noise = gen_white(x, y, seed = 1234, frequency = 1)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-8-1.png)

    grid %>%
      mutate(noise = gen_white(x, y, seed = 1234, frequency = 0.00001)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-8-2.png)

# Worley

    grid %>%
      mutate(noise = gen_worley(x, y, seed = 1234, frequency = 1)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-9-1.png)

    grid %>%
      mutate(noise = gen_worley(x, y, seed = 1234, frequency = 0.75)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-9-2.png)

    grid %>%
      mutate(noise = gen_worley(x, y, seed = 1234, frequency = 0.5)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-9-3.png)

    grid %>%
      mutate(noise = gen_worley(x, y, seed = 1234, frequency = 0.25)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-9-4.png)

    grid %>%
      mutate(noise = gen_worley(x, y, seed = 1234, frequency = 0.1)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-9-5.png)

    grid %>%
      mutate(noise = gen_waves(x, y, seed = 1234, frequency = 0.075)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-9-6.png)

    grid %>%
      mutate(noise = gen_worley(x, y, seed = 1234, frequency = 0.05)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-9-7.png)

    grid %>%
      mutate(noise = gen_worley(x, y, seed = 1234, frequency = 0.01)) %>%
      colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/unnamed-chunk-9-8.png)
