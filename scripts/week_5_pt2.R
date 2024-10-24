library(tidyverse)

tail <- read.csv("data/tail_length.csv")
head(tail)
dim(tail)

# join_function (data fram a, data frame b, how to join)
# inner_join(data frame a, data frame b, common id)
#inner_join only keeps records that are in both data frames

surveys <- read.csv("data/portal_data_joined.csv")
dim(inner_join(x = surveys, y = tail, by = 'record_id'))
dim(surveys)
dim(tail)

#left_join
#left_join takes dataframe x and dataframe y and it keeps everything in x and only matches in y
#left_join(x,y) == right_join(y,x)
#right_join takes dataframe x and dataframe y and it keeps everything in y and only matches in x
#right_join(x,y) == left_join(y,x)

surveys_left_joined <- left_join(x = surveys, y = tail, by = 'record_id')

surveys_right_joined <- right_join(y = surveys, x = tail, by = 'record_id')

dim(surveys_left_joined)
dim(surveys_right_joined)

# full_join (x,y)
# full_join keeps EVERYTHING

surveys_full_joined <- full_join(x = surveys, y = tail)
dim(surveys_full_joined)
