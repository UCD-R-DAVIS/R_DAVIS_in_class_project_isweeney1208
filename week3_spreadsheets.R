surveys <- read.csv("data/portal_data_joined.csv")
nrow(surveys)
ncol(surveys)

dim(surveys)

str(surveys)
surveys
class(surveys)


head(surveys)
summary(object = surveys)
summary.data.frame(surveys)

surveys[1,5]

#first 5 rows
surveys[1:5,]

surveys[c(1,5,24, 3001),]

surveys[,1]
surveys[1,]

dim(surveys[,1:5])

surveys[c('record_id','year','day')]

head(surveys)

head(surveys["genus"]) #show column, keep object the same
head(surveys[["genus"]]) #get vectors out and do other stuff

surveys$genus

surveys$hindfoot_length

class(surveys$hindfoot_length)

install.packages('tidyverse')

library(tidyverse)
?read_csv

t_surveys <- read.csv('data/portal_data_joined.csv')
class(t_surveys)
t_surveys

surveys[,1]
class(t_surveys)
