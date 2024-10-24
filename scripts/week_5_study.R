library(tidyverse)

surveys <- read.csv("data/portal_data_joined.csv")

str(surveys)

summary(surveys$hindfoot_length) #shows summary of variable in survey i.e hind foot length


#psuedocode
#ifelse(test or condition, tell what to do if test is yes/true, what to do if false/not true)

#boolean test
surveys$hindfoot_length < 29.29
# this is showing whats greater than 29.29, TRUE, values that are less than are false

surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length < 29.29, yes = "small", no = "big") #sets conditional statement for hindfoot length greater than 29.29, as we hardcoded what the mean was  

head(surveys$hindfoot_cat) #Shows head of object 

head(surveys$hindfoot_length)

surveys$hindfoot_length <- ifelse(surveys$hindfoot_length < mean(surveys$hindfoot_length, na.rm = TRUE), yes= "small", no = "big")
#also sets conditional statement using more robust coding, calculating the mean. also removes NAs and sets conditions.

head(surveys$hindfoot_length)

# it gets messy after more than 2 conditions
# case_when() allows to set many cases and or arguments. mutate #specifies new column

surveys %>%  
  mutate(hindfoot_cat =case_when(
    hindfoot_length > 29.29 ~ "big",
    is.na(hindfoot_length) ~ NA_character_, # also other types: NA_integer_
    TRUE ~ "small" #weird syntax... but essentially the "else" part
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head() 

#adding more categories

surveys %>%  
  mutate(hindfoot_cat =case_when(
    hindfoot_length > 31.5 ~ "big",
    hindfoot_length > 29 ~ "medium",
    is.na(hindfoot_length) ~ NA_character_, 
    TRUE ~ "small",
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  group_by(hindfoot_cat) %>% 
  tally()
