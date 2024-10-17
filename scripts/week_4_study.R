install.packages("tidyverse")

library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

str(surveys) #shows dataset of surveys

#select colums

month_day_year <- select(surveys, month, day, year)

#filtering by equals

filter(surveys, year == 1981)

#filtering by range (ex. multiple years) 
filter(surveys, year %in% c(1981:1983))
    # %in% does bucket matching, looks at years found in bucket of 1981-1983

#review: why you should NEVER do: 
filter(surveys, year == c(1981, 1982, 1983))
    # This recycles the vector.
    # c(1981, 1982, 1983) only checks each subsequent row (1,2,3) to see if
    # it matches with the given sequence, not properly filtering out years

#filtering by multiple conditions
bigfoot_with_weight <- filter(surveys, hindfoot_length > 40 & !is.na(weight))

#multi-step process
small_animals <- filter(surveys, weight < 5)
    #this is dangerous, because you must remeber to select from 'small_animals' dataframe just created and NOT surveys

small_animals_id <- select(small_animals, record_id, plot_id, species_id)

#same process using nested functions, but clunky

small_animals_id <- select(filter(surveys, weight < 5), record_id, plot_id, species_id)

#same process can be done using a pipe
#Cmd shift M 
# or |>

small_animals_id <- filter(surveys, weight < 5) %>%  select(record_id, plot_id, species_id)

#same as
small_animals_id <- surveys %>%  filter(weight < 5) %>% select(record_id, plot_id,species_id)

#how to do line breaks with pipes
surveys %>% filter(month==1)

# good: 
surveys %>% 
  filter(month==1)

#not good:
surveys
%>% filter(month==1)

#line break rules: after open parenthesis, pipe, commas, or anything that shows the line is NOT complete yet
  #cant end statement on a pipe
  