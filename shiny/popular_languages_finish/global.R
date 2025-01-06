library(shiny)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(readr)
library(lubridate)

# data prep

# source: https://www.kaggle.com/datasets/muhammadkhalid/most-popular-programming-languages-since-2004
df <- read_csv("./data/Most Popular Programming Languages from 2004 to 2022.csv") %>% 
  dplyr::mutate(timestamp = lubridate::my(Date)) %>% 
  dplyr::select(-Date)



df_long <- df %>% 
  pivot_longer(cols = !timestamp, names_to = "language", values_to = "popularity")

language_choices <- df_long$language %>% unique()

date_start <- df_long$timestamp %>% min()
date_end <- df_long$timestamp %>% max()
