#ENV 224 Final R DAVIS

# Load 
library(tidyverse)
library(lubridate)


url <- "https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv"

data <- read_csv(url)

# view data
head(data)
glimpse(data)


# Filter out everything but running
running_data <- data %>% 
  filter(sport == "running") # Replace 'activity_type' with the correct column name, if different

# Filter out walking, extremely fast laps, and laps with elapsed time <= 1 minute
filtered_data <- running_data %>% 
  filter(minutes_per_mile <= 10,       # Remove laps with pace > 10 min/mile
         minutes_per_mile >= 5,        # Remove laps with pace < 5 min/mile
         minutes_per_mile > 1) # Remove laps with elapsed time <= 1 minute


# Ensure timestamp column is properly formatted and extract the date portion
categorized_data <- filtered_data %>%
  mutate(date = as.Date(timestamp), # Extract just the date from timestamp
         time_period = case_when(
           date < as.Date("2024-01-01") ~ "Pre-2024",
           date >= as.Date("2024-01-01") & date <= as.Date("2024-06-30") ~ "Rehab (Jan-Jun)",
           date > as.Date("2024-07-01") ~ "Post-July"
         ))


# steps per minute / minutes per mile
ggplot(categorized_data, aes(x = minutes_per_mile, y = steps_per_minute, color = time_period)) +
  geom_point() +
  labs(title = "SPM vs Speed by Lap", 
       x = "Speed (minutes per mile)", 
       y = "Steps per minute (SPM)",
       color = "Time Period")


