library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")


surveys <- surveys %>%
  mutate(weight_kg = weight/1000)
head(surveys)
str(surveys)

#add other columns

surveys <- surveys %>%
  mutate(weight_kg = weight/1000, 
         weight_kg2 = weight_kg*2)
str(surveys)

surveys$weight_kg2 = as.character(surveys$weight_kg2)
str(surveys)

#filter out NAs
avg_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(mean_weight = mean(weight))

str(avg_weight)
nrow(avg_weight)

avg_weight <- surveys %>% 
  filter(complete.cases(.))

nrow(avg_weight)

##group and summarize
# group_by and summarize functions are often used together to split data in groups, apply analysis to each group, %>% 
 # the results. group_by works for columns with categorical variables

surveys %>% 
  group_by(sex) %>% 
  mutate(mean_weight = mean (weight, na.rm = TRUE))

surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean (weight, na.rm = TRUE))

df <- surveys %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean (weight, na.rm = TRUE))

summary(df)

##sort and arrange order a certain way

df <- surveys %>% 
  group_by(sex, species_id) %>% 
  filter(sex != "") %>% 
  summarize(mean_weight = mean (weight, na.rm = TRUE)) %>% 
  arrange(-mean_weight)

# Challenge
#What was the weight of the heaviest animal measured in each year? 
#Return a table with three columns: year, weight of the heaviest animal in grams, 
#and weight in kilograms, arranged (arrange()) in descending order, from heaviest to lightest. 
#(This table should have 26 rows, one for each year)

challenge <- surveys %>%
  mutate(weight_kg = weight/1000) %>% 
  group_by(year) %>% 
  summarize(max_weight = max(weight, na.rm = TRUE), max_weight_kg = max(weight_kg, na.rm = TRUE)) %>%
  arrange(-max_weight)


#Try out a new function, count(). Group the data by sex and pipe the grouped data into the count() function. 
# How could you get the same result using group_by() and summarize()? Hint: see ?n.

surveys %>%  group_by(sex) %>% count()
