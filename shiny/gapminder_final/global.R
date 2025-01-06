library(ggplot2)
library(dplyr)
library(tidyr)
library(gapminder)

year_start <- gapminder$year %>% min()
year_end <- gapminder$year %>% max()

continents <- gapminder$continent %>% unique()
