#conditional statements challenge

library(tidyverse)

iris <- iris

summary(iris)

# "small" <= 1.6 
# "medium" = 1.6:5.1
# "large" >= 5.1

iris %>% 
  mutate(Petal.Length_cat = case_when(
    Petal.Length <= 1.6 ~ "small",
    Petal.Length = 1.6:5.1 ~ "medium",
    Petal.Length >= 5.1 ~ "large"
  ))