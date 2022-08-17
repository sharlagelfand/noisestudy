generate_noise <- function(data, noise, frequency, seed = 1234) {
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
  )
}
