install.packages("tidyverse")

library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

str(surveys) #shows dataset of surveys

#select columns, select certain columns

month_day_year <- select(surveys, month, day, year)

#filtering by equals, to select certain rows

filter(surveys, year == 1981)
year_1981 <- filter(surveys, year == 1981)
  ## year_1981_baser <- surveys[surveys$year == 1981, ] is baser version

sum(year_1981$year != 1981, na.rm = T)


#filtering by range (ex. multiple years) 
#filter r base
the80s <- surveys[surveys$year %in% 1981:1983, ]
#filter tidy

the80stidy <- filter(surveys, year %in% 1981:1983)

filter(surveys, year %in% c(1981:1983))
    # %in% does bucket matching, looks at years found in bucket of 1981-1983

#review: why you should NEVER do: 
the80srecycle <- filter(surveys, year == c(1981, 1982, 1983))
    # This recycles the vector.
    # c(1981, 1982, 1983) only checks each subsequent row (1,2,3) to see if
    # it matches with the given sequence, not properly filtering out years

#filtering by multiple conditions
bigfoot_with_weight <- filter(surveys, hindfoot_length > 40 & !is.na(weight))

#multi-step process
small_animals <- filter(surveys, weight < 5)
    #this is dangerous, because you must remeber to select from 'small_animals' data frame just created and NOT surveys

small_animals_id <- select(small_animals, record_id, plot_id, species_id)

#same process using nested functions, but clunky

small_animals_id <- select(filter(surveys, weight < 5), record_id, plot_id, species_id)

#same process can be done using a pipe
#Cmd shift M (%>%)
# or |>

small_animals_id <- filter(surveys, weight < 5) %>%  select(record_id, plot_id, species_id)

#same as
small_animals_id <- surveys %>%  filter(., weight < 5) %>% select(.,record_id, plot_id,species_id)

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
  
#one final review of a concept

mini <- surveys[190:209, ]
table(mini$species_id)

#rows
nrow(mini)

test <- mini %>% filter(species_id %in% c("DM","NL"))
nrow(test)


### PART 2