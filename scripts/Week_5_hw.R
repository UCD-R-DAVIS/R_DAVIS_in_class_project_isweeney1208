library(tidyverse)

surveys <- read.csv("data/portal_data_joined.csv")

str(surveys)

surveys %>% 
  filter(hindfoot_length)
         select(genus, plot_type)
 
#no good
         
?pivot_wider

surveys_wide <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% #removes NA from hindfoot length
  group_by(genus, plot_type) %>% #selecting genus type and plot type
  summarise(avg_hindfoot = mean(hindfoot_length)) %>% #each column to contain the mean hindfoot length value
  pivot_wider(names_from = plot_type, values_from = avg_hindfoot) %>% 
  arrange(Control)

#Using the original surveys dataframe, use the two different functions we laid out for 
#conditional statements, ifelse() and case_when(), to calculate a new weight category 
#variable called weight_cat. For this variable, define the rodent weight into three categories, 
#where “small” is less than or equal to the 1st quartile of weight distribution, 
#“medium” is between (but not inclusive) the 1st and 3rd quartile, and “large” is any weight
#greater than or equal to the 3rd quartile. 

summary(surveys$weight)

#small <= 20.00
#medium > 20.00 & weight < 48.00
#large >= 48.00

surveys %>% 
  mutate(weight_cat = case_when(
    weight <= 20.00 ~ "small",
    weight > 20.00 & weight < 48.00 ~ "medium",
    weight >= 48.00 ~ "large"
  ))

surveys$weight_cat <- if_else(surveys$weight_cat
   

  

         