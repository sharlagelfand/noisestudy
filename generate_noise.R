generate_noise <- function(data, noise, frequency, seed = 1234, normalise = FALSE) {
  switch(noise,
    cubic = data %>%
      mutate(noise = gen_cubic(x, y, seed = seed, frequency = frequency)),
    perlin = data %>%
      mutate(noise = gen_perlin(x, y, seed = seed, frequency = frequency)),
    simplex = data %>%
      mutate(noise = gen_simplex(x, y, seed = seed, frequency = frequency)),
    spheres = data %>%
      mutate(noise = gen_spheres(x, y, seed = seed, frequency = frequency)),
    waves = data %>%
      mutate(noise = gen_waves(x, y, seed = seed, frequency = frequency)),
    white = data %>%
      mutate(noise = gen_white(x, y, seed = seed, frequency = frequency)),
    worley = data %>%
      mutate(noise = gen_worley(x, y, seed = seed, frequency = frequency))
  ) %>%
    normalise_noise(normalise)
}

normalise_noise <- function(data, normalise = FALSE) {
  noise_values <- unique(data$noise)
  multiple_values <- length(noise_values) > 1

  to_be_normalised <- min(noise_values) < -1 | max(noise_values) > 1
  to_be_normalised <- to_be_normalised & multiple_values

  if (to_be_normalised | normalise) {
    data <- data %>%
      mutate(noise = normalise(noise))
  }

  data
}
