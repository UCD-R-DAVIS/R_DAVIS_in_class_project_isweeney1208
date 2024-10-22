#create a tibble named "surveys" from portal_data_joined.csv file

library(tidyverse)

surveys <- read.csv("data/portal_data_joined.csv")

#subset surveys using tidyverse methods to keep rows with weight between 30 and 60, and print first 6 rows.

filter(surveys, weight %in% c(30:60)) %>% 
