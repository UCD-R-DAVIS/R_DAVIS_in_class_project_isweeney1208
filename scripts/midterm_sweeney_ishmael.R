library(tidyverse)

#bring in tyler activity laps

link <- 'https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv'

laps <- read_csv(link)

summary(laps)

#filter so it's only running
laps %>% 
  filter(sport %in% c('running')) 
  
#remove any lap with pace above 10 minutes per mile, and abnormally fast laps less than 5 minutes, and less than one minute

running_laps <- laps %>% 
  filter(sport %in% c('running')) %>% 
  filter(minutes_per_mile < 10.0, minutes_per_mile > 5.0) %>% 
  filter(total_elapsed_time_s >= 60)

#create new variable, pace, categorizing laps by pace - 
# < 6:00 minutes per mile ~ fast , 
# 6:00 to 8:00 ~ medium ,
# > 8:00 ~ slow

running_laps <- laps %>% 
  mutate(pace_cat = case_when(
    minutes_per_mile <= 6 ~ "fast",
    minutes_per_mile > 6 & minutes_per_mile < 8 ~ "medium",
    minutes_per_mile >= 8 ~ "slow"
  ))

  


