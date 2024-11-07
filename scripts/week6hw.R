library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

summary(gapminder)

gapminder %>% 
  group_by(year, continent) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>%
  ggplot()+
  geom_point(aes(x = year, y = mean_lifeExp, color = continent))+
  geom_line(aes(x = year, y= mean_lifeExp, color = continent))+
  facet_wrap(~continent)

