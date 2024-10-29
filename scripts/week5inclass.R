#pivots change shapes

surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight))

str(surveys_mz) #let's take a look at the data

unique(surveys_mz$genus) #lists every unique genus in surveys_mz

n_distinct(surveys_mz$genus) #another way to look at the number of distinct genera

n_distinct(surveys_mz$plot_id)


wide_survey <- surveys_mz %>% 
  pivot_wider(names_from = "plot_id", values_from =  "mean_weight")

head(wide_survey)

#cols = columns to be pivoted. Here we want to pivot all the plot_id columns, except the colum "genus"
#names_to = the name of the new column we created from the `cols` argument 
#values_to = the name of the new column we will put our values in

surveys_long <- wide_survey %>% 
  pivot_longer(col = -genus, names_to = "plot_id", values_to = "mean_weight")