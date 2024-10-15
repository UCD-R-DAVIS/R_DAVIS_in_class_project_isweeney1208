#import data frame
surveys <- read.csv("data/portal_data_joined.csv")

#originally I tried surveys[1:5000,("species_id","weight","plot_type")]

surveys[1:5000,c("species_id","weight","plot_type")]

surveys_base <- surveys[1:5000,c("species_id","weight","plot_type")] # only shows first 5000 rows with columns for species id, weight, and plot type

class(surveys_base$species_id) #R tells me it is a factor

typeof(surveys_base$species_id) #R tells me it is an integer

surveys_base$species_id<- factor(surveys_base$species_id)

?c

surveys_base$species_id <- factor(surveys_base$species_id) #factors species id from character to integer

surveys_base$plot_type <- factor(surveys_base$plot_type) # factors plot type from character to integer

surveys_base<- surveys_base[!is.na(surveys_base$weight), ] # removes NA from weight column in survey base data frame, [] is like a plot

surveys_base<- surveys_base[complete.cases(surveys_base$weight),]

na.fail(surveys_base$weight)

challenge_base <- surveys_base[surveys_base$weight>150,]
challenge_base
