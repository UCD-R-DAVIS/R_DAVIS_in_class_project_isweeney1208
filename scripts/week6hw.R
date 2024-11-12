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

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() + # I think this code allows the x variable to be in scale for the plot graph. Manipulates label to overide the default scale_x_continuous
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

?scale_x_log10

?population
