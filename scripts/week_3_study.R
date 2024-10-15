#week3

#Following videos

surveys <- read.csv("data/portal_data_joined.csv") #pulls in data table
str(surveys) #structure of surveys
surveys #will show object in console, truncated to 76 rows
class(surveys) #it is a data frame object

nrow(surveys) # shows number of rows
ncol(surveys) # shows number of columns
str(surveys) #structure of surveys

head(surveys) # shows top of survey
tail(surveys) # shows bottom of survey
?head #description of head command
# default head command shows 6 rows

head(surveys, n = 11) # n = will allow for specific number of rows to be shown

?summary # info on summary command
summary(surveys) # provides descriptive variable summary

surveys$sex # either M or F, says the class

surveys [1,3] #brackets tells R to take out pieces of the object such as data frames or vectors

head(surveys, 1)

surveys[1, ] #tells R show all columns in 1st row

surveys[ ,1] #all values in 1st column

surveys[1] #just first column

surveys[1:3, ] #First 3 rows

1:10

surveys[1:10, ]

surveys[ ,1:3] #all rows of first 3 columns

surveys[1:3, 1:3] #first 3 columns and 3 rows

surveys[c(1,4,10),c(2,4,6)]

surveys [ ,-1] #surveys without first column

surveys [-1, ] #surveys without first row

surveys[-c(7:nrow(surveys))] #row 7 to last observation in data frame

?c

survey_base[!is.na(survey_base)]

