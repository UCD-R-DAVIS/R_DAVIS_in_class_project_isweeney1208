#create a tibble named "surveys" from portal_data_joined.csv file

library(tidyverse)

surveys <- read.csv("data/portal_data_joined.csv")

#subset surveys using tidyverse methods to keep rows with weight between 30 and 60, and print first 6 rows.

surveys %>% 
  filter(weight %in% c(30:60)) %>% head(surveys, n = 6)

#Create a new tibble showing the maximum weight for each species + sex combination and 
#name it biggest_critters. Sort the tibble to take a look at the biggest and smallest 
#species + sex combinations. HINT: it’s easier to calculate max if there are no NAs in the data frame…

biggest_critters <- surveys %>% 
  filter(!is.na(weight)) %>% #removes NA from weight
  group_by(sex, species_id) %>% #groups by sex and species id
  summarize(max_weight = max(weight, na.rm = TRUE)) %>% #summarize creates new data frame
  arrange(max_weight) #arranges the max weight column

?summarize
#above shows from lowest weight 

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(max_weight = max(weight, na.rm = TRUE)) %>% 
  arrange(-max_weight)

#above shows from the highest weight

#Try to figure out where the NA weights are concentrated in the data- 
# is there a particular species, taxa, plot, or whatever, where there are lots of NA values? 
# There isn’t necessarily a right or wrong answer here, but manipulate surveys a few different 
# ways to explore this. Maybe use tally and arrange here.

?tally
              
surveys %>% 
  filter(!is.na(plot_id)) %>% 
  group_by(plot_id) %>% 
  tally() %>% 
  arrange(-plot_id)

# Did not work 

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(plot_id, species, taxa) %>% 
  tally() %>% 
  arrange(desc(n))

#doesnt give good results

surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(species) %>% 
  tally() %>% 
  arrange(desc(n))

surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(plot_id) %>% 
  tally() %>% 
  arrange(desc(n))

surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(year) %>% 
  tally() %>% 
  arrange(desc(n))

#Why does nothing go in tally?

surveys_avg_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species, sex) %>% 
  mutate(avg_weight = mean(weight)) %>% #creates new column
  select(species, sex, weight, avg_weight)

?mutate

surveys_avg_weight <- surveys_avg_weight %>% 
  mutate(above_average = avg_weight < weight)

surveys_avg_weight
            