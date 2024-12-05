#week 9 hw

surveys <- read.csv("data/portal_data_joined.csv")

#1

for(i in unique(surveys$taxa)){
  mytaxon <- surveys[surveys$taxa == i,]
  longestnames <- mytaxon[nchar(mytaxon$species)== max(nchar(mytaxon$species)),] %>% select(species)
  print(paste0("The longest species name(s) among" ,i,"s is/are:"))
  print(unique(longestnames$species))
}

library(dplyr)

# Find the longest species name for each taxa
longest_species <- surveys %>%
  group_by(taxa) %>%
  filter(nchar(species) == max(nchar(species), na.rm = TRUE)) %>%
  summarise(longest_species = unique(species), .groups = 'drop')

# Print the results
longest_species %>%
  rowwise() %>%
  do({
    cat(paste0("The longest species name(s) among ", .$taxa, "s is/are:\n"))
    print(.$longest_species)
  })

#2

mloa <- read.csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

summary(mloa)

mycols <- mloa %>% select("windDir","windSpeed_m_s","baro_hPa","temp_C_2m","temp_C_10m","temp_C_towertop","rel_humid", "precip_intens_mm_hr")
mycols %>% map(max, na.rm = T)

mloa %>%
  select("windDir", "windSpeed_m_s", "baro_hPa", "temp_C_2m", "temp_C_10m", "temp_C_towertop", "rel_humid", "precip_intens_mm_hr") %>%
  summarise(across(everything(), ~ max(.x, na.rm = TRUE)))