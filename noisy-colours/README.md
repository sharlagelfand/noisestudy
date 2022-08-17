    library(prismatic)
    library(dplyr, warn.conflicts = FALSE)
    library(ambient)
    library(tidyr)
    library(ggplot2)

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

# Random sample

    set.seed(1234)

    grid %>%
      rowwise() %>%
      mutate(noise = runif(1, -1, 1)) %>%
      ungroup() %>%
      shift_colour_from_noise() %>%
      plot_grid()

![](README_files/figure-markdown_strict/sample-1.png)

# Cubic

    grid %>%
      plot_noisy_colour("cubic", 1)

![](README_files/figure-markdown_strict/cubic-1.png)

    grid %>%
      plot_noisy_colour("cubic", 0.5)

![](README_files/figure-markdown_strict/cubic-2.png)

    grid %>%
      plot_noisy_colour("cubic", 0.25)

![](README_files/figure-markdown_strict/cubic-3.png)

    grid %>%
      plot_noisy_colour("cubic", 0.1)

![](README_files/figure-markdown_strict/cubic-4.png)

    grid %>%
      plot_noisy_colour("cubic", 0.05)

![](README_files/figure-markdown_strict/cubic-5.png)

    grid %>%
      plot_noisy_colour("cubic", 0.01)

![](README_files/figure-markdown_strict/cubic-6.png)

# Perlin

    grid %>%
      plot_noisy_colour("perlin", 0.99)

![](README_files/figure-markdown_strict/perlin-1.png)

    grid %>%
      plot_noisy_colour("perlin", 0.5)

![](README_files/figure-markdown_strict/perlin-2.png)

    grid %>%
      plot_noisy_colour("perlin", 0.25)

![](README_files/figure-markdown_strict/perlin-3.png)

    grid %>%
      plot_noisy_colour("perlin", 0.1)

![](README_files/figure-markdown_strict/perlin-4.png)

    grid %>%
      plot_noisy_colour("perlin", 0.05)

![](README_files/figure-markdown_strict/perlin-5.png)

    grid %>%
      plot_noisy_colour("perlin", 0.01)

![](README_files/figure-markdown_strict/perlin-6.png)

# Simplex

    grid %>%
      plot_noisy_colour("simplex", 1)

![](README_files/figure-markdown_strict/simplex-1.png)

    grid %>%
      plot_noisy_colour("simplex", 0.5)

![](README_files/figure-markdown_strict/simplex-2.png)

    grid %>%
      plot_noisy_colour("simplex", 0.25)

![](README_files/figure-markdown_strict/simplex-3.png)

    grid %>%
      plot_noisy_colour("simplex", 0.1)

![](README_files/figure-markdown_strict/simplex-4.png)

    grid %>%
      plot_noisy_colour("simplex", 0.05)

![](README_files/figure-markdown_strict/simplex-5.png)

    grid %>%
      plot_noisy_colour("simplex", 0.01)

![](README_files/figure-markdown_strict/simplex-6.png)

# Spheres

    grid %>%
      plot_noisy_colour("spheres", 1)

![](README_files/figure-markdown_strict/spheres-1.png)

    grid %>%
      plot_noisy_colour("spheres", 0.5)

![](README_files/figure-markdown_strict/spheres-2.png)

    grid %>%
      plot_noisy_colour("spheres", 0.25)

![](README_files/figure-markdown_strict/spheres-3.png)

    grid %>%
      plot_noisy_colour("spheres", 0.1)

![](README_files/figure-markdown_strict/spheres-4.png)

    grid %>%
      plot_noisy_colour("spheres", 0.05)

![](README_files/figure-markdown_strict/spheres-5.png)

    grid %>%
      plot_noisy_colour("spheres", 0.01)

![](README_files/figure-markdown_strict/spheres-6.png)

# Waves

    grid %>%
      plot_noisy_colour("waves", 1)

![](README_files/figure-markdown_strict/waves-1.png)

    grid %>%
      plot_noisy_colour("waves", 0.5)

![](README_files/figure-markdown_strict/waves-2.png)

    grid %>%
      plot_noisy_colour("waves", 0.25)

![](README_files/figure-markdown_strict/waves-3.png)

    grid %>%
      plot_noisy_colour("waves", 0.1)

![](README_files/figure-markdown_strict/waves-4.png)

    grid %>%
      plot_noisy_colour("waves", 0.05)

![](README_files/figure-markdown_strict/waves-5.png)

    grid %>%
      plot_noisy_colour("waves", 0.01)

![](README_files/figure-markdown_strict/waves-6.png)

# White

    grid %>%
      plot_noisy_colour("white", 0.99)

![](README_files/figure-markdown_strict/white-1.png)

    grid %>%
      plot_noisy_colour("white", 0.5)

![](README_files/figure-markdown_strict/white-2.png)

    grid %>%
      plot_noisy_colour("white", 0.25)

![](README_files/figure-markdown_strict/white-3.png)

    grid %>%
      plot_noisy_colour("white", 0.1)

![](README_files/figure-markdown_strict/white-4.png)

    grid %>%
      plot_noisy_colour("white", 0.05)

![](README_files/figure-markdown_strict/white-5.png)

    grid %>%
      plot_noisy_colour("white", 0.01)

![](README_files/figure-markdown_strict/white-6.png)

# Worley

    grid %>%
      plot_noisy_colour("worley", 1)

![](README_files/figure-markdown_strict/worley-1.png)

    grid %>%
      plot_noisy_colour("worley", 0.5)

![](README_files/figure-markdown_strict/worley-2.png)

    grid %>%
      plot_noisy_colour("worley", 0.25)

![](README_files/figure-markdown_strict/worley-3.png)

    grid %>%
      plot_noisy_colour("worley", 0.1)

![](README_files/figure-markdown_strict/worley-4.png)

    grid %>%
      plot_noisy_colour("worley", 0.05)

![](README_files/figure-markdown_strict/worley-5.png)

    grid %>%
      plot_noisy_colour("worley", 0.01)

![](README_files/figure-markdown_strict/worley-6.png)
