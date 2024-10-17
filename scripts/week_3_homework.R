#load survey data frame

surveys <- read.csv("data/portal_data_joined.csv")

# 1. create data frame with only species id, weight, and plot_type columns, with only first 5000 rows

    #originally I tried this

    # surveys[1:5000,("species_id","weight","plot_id")]

    # But did not work, because I forgot to add c which combines values
    
# I used "surveys[1:5000, c("species_id","weight","plot_id")]"

survey_base <- surveys[1:5000, c("species_id","weight","plot_id")]

#2.  Convert species id and plot_type to factors

# used as.factor to convert to factors, didnt work

typeof(survey_base$species_id)

class("species_id")

is.factor("species_id")
?as.factor

as.factor("species_id")

as.factor("plot_type")

#tried factor[survey_base["species_id"],] didnt work

survey_base$species_id <- factor(survey_base$species_id)

survey_base$plot_type <- factor(survey_base$plot_id)

levels(survey_base$species_id)

# 3 remove all rows with NA. is.na(survey_base) shows where NA is TRUE
    # survey_base[!is.na(survey_base)] does not look right

#tried survey_base[complete.cases(survey_base)] but did not work because I forgot a comma. Added comma and works.

survey_base[complete.cases(survey_base), ]

# 4. a factor is different from a character because it turns the character into an integer, with labels attached instead of just a number.

