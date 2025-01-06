library(shiny)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(readr)
library(lubridate)

# data prep

# source: https://www.kaggle.com/datasets/muhammadkhalid/most-popular-programming-languages-since-2004
df <- read_csv("./data/Most Popular Programming Languages from 2004 to 2022.csv")