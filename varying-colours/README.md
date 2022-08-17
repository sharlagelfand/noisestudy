    library(tidyr)
    library(dplyr, warn.conflicts = FALSE)
    library(ggplot2)
    library(ambient)

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

    grid <- crossing(x = -15:15, y = -15:15)

    colour_from_noise <- function(data) {
      data %>%
        # bin into groups and choose colour from there
        mutate(
          colour = ntile(noise, length(colours)),
          colour = colours[colour]
        )
    }

    plot_grid <- function(data) {
      data %>%
        ggplot() +
        geom_tile(aes(x = x, y = y, fill = colour, width = 0.9, height = 0.9)) +
        scale_fill_identity() +
        coord_fixed() +
        theme_void()
    }

    plot_noise_colours <- function(data, noise, frequency, seed = 1234) {
      data %>%
        generate_noise(noise, frequency, seed) %>%
        colour_from_noise() %>%
        plot_grid()
    }

# Random sample

    set.seed(1234)

    grid %>%
      rowwise() %>%
      mutate(colour = sample(colours, 1)) %>%
      ungroup() %>%
      plot_grid()

![](README_files/figure-markdown_strict/sample-1.png)

# Cubic

    grid %>%
      plot_noise_colours("cubic", 1)

![](README_files/figure-markdown_strict/cubic-1.png)

    grid %>%
      plot_noise_colours("cubic", 0.5)

![](README_files/figure-markdown_strict/cubic-2.png)

    grid %>%
      plot_noise_colours("cubic", 0.25)

![](README_files/figure-markdown_strict/cubic-3.png)

    grid %>%
      plot_noise_colours("cubic", 0.1)

![](README_files/figure-markdown_strict/cubic-4.png)

    grid %>%
      plot_noise_colours("cubic", 0.05)

![](README_files/figure-markdown_strict/cubic-5.png)

    grid %>%
      plot_noise_colours("cubic", 0.01)

![](README_files/figure-markdown_strict/cubic-6.png)

# Perlin

    grid %>%
      plot_noise_colours("perlin", 1)

![](README_files/figure-markdown_strict/perlin-1.png)

    grid %>%
      plot_noise_colours("perlin", 0.5)

![](README_files/figure-markdown_strict/perlin-2.png)

    grid %>%
      plot_noise_colours("perlin", 0.25)

![](README_files/figure-markdown_strict/perlin-3.png)

    grid %>%
      plot_noise_colours("perlin", 0.1)

![](README_files/figure-markdown_strict/perlin-4.png)

    grid %>%
      plot_noise_colours("perlin", 0.05)

![](README_files/figure-markdown_strict/perlin-5.png)

    grid %>%
      plot_noise_colours("perlin", 0.01)

![](README_files/figure-markdown_strict/perlin-6.png)

# Simplex

    grid %>%
      plot_noise_colours("simplex", 1)

![](README_files/figure-markdown_strict/simplex-1.png)

    grid %>%
      plot_noise_colours("simplex", 0.5)

![](README_files/figure-markdown_strict/simplex-2.png)

    grid %>%
      plot_noise_colours("simplex", 0.25)

![](README_files/figure-markdown_strict/simplex-3.png)

    grid %>%
      plot_noise_colours("simplex", 0.1)

![](README_files/figure-markdown_strict/simplex-4.png)

    grid %>%
      plot_noise_colours("simplex", 0.05)

![](README_files/figure-markdown_strict/simplex-5.png)

    grid %>%
      plot_noise_colours("simplex", 0.01)

![](README_files/figure-markdown_strict/simplex-6.png)

# Spheres

    grid %>%
      plot_noise_colours("spheres", 1)

![](README_files/figure-markdown_strict/spheres-1.png)

    grid %>%
      plot_noise_colours("spheres", 0.5)

![](README_files/figure-markdown_strict/spheres-2.png)

    grid %>%
      plot_noise_colours("spheres", 0.25)

![](README_files/figure-markdown_strict/spheres-3.png)

    grid %>%
      plot_noise_colours("spheres", 0.1)

![](README_files/figure-markdown_strict/spheres-4.png)

    grid %>%
      plot_noise_colours("spheres", 0.05)

![](README_files/figure-markdown_strict/spheres-5.png)

    grid %>%
      plot_noise_colours("spheres", 0.01)

![](README_files/figure-markdown_strict/spheres-6.png)

# Waves

    grid %>%
      plot_noise_colours("waves", 1)

![](README_files/figure-markdown_strict/waves-1.png)

    grid %>%
      plot_noise_colours("waves", 0.5)

![](README_files/figure-markdown_strict/waves-2.png)

    grid %>%
      plot_noise_colours("waves", 0.25)

![](README_files/figure-markdown_strict/waves-3.png)

    grid %>%
      plot_noise_colours("waves", 0.1)

![](README_files/figure-markdown_strict/waves-4.png)

    grid %>%
      plot_noise_colours("waves", 0.05)

![](README_files/figure-markdown_strict/waves-5.png)

    grid %>%
      plot_noise_colours("waves", 0.01)

![](README_files/figure-markdown_strict/waves-6.png)

# White

    grid %>%
      plot_noise_colours("white", 1)

![](README_files/figure-markdown_strict/white-1.png)

    grid %>%
      plot_noise_colours("white", 0.5)

![](README_files/figure-markdown_strict/white-2.png)

    grid %>%
      plot_noise_colours("white", 0.25)

![](README_files/figure-markdown_strict/white-3.png)

    grid %>%
      plot_noise_colours("white", 0.1)

![](README_files/figure-markdown_strict/white-4.png)

    grid %>%
      plot_noise_colours("white", 0.05)

![](README_files/figure-markdown_strict/white-5.png)

    grid %>%
      plot_noise_colours("white", 0.01)

![](README_files/figure-markdown_strict/white-6.png)

# Worley

    grid %>%
      plot_noise_colours("worley", 1)

![](README_files/figure-markdown_strict/worley-1.png)

    grid %>%
      plot_noise_colours("worley", 0.5)

![](README_files/figure-markdown_strict/worley-2.png)

    grid %>%
      plot_noise_colours("worley", 0.25)

![](README_files/figure-markdown_strict/worley-3.png)

    grid %>%
      plot_noise_colours("worley", 0.1)

![](README_files/figure-markdown_strict/worley-4.png)

    grid %>%
      plot_noise_colours("worley", 0.05)

![](README_files/figure-markdown_strict/worley-5.png)

    grid %>%
      plot_noise_colours("worley", 0.01)

![](README_files/figure-markdown_strict/worley-6.png)
