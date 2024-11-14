library(tidyverse)
library(ggplot2)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point()

#all over color
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(color = "blue")
#color by variable
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) #alpha incrases transparancy

#plot best practices:
#remove backgrounds, redundant labels, borders, colors, special effects, 
# bolding, lighten labels, remove lines, direct label.

#removes backgroun
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) + theme_classic()

#keep it simple, label axes, start at 0
#added a title and added linear regression trendlines for each color
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) + theme_classic() +
  ggtitle("Price by Diamond Quality") + ylab("price in $") +
  stat_smooth(method = "lm")

#LOESS trendcurves for each color
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) + theme_classic() +
  ggtitle("Price by Diamond Quality") + ylab("price in $") +
  stat_smooth(method = "loess")

#2B Color

library(RColorBrewer)
#list of all RColorBrewers colorblind friendly discrete
display.brewer.all(colorblindFriendly = TRUE)
#Continuous Data
ggplot(diamonds, aes(x = clarity, y = carat, color = price)) +
  geom_point(alpha = 0.2) + theme_classic() +
  scale_color_viridis_c(option = "A", direction = -1)

#different color scheme using a different letter
ggplot(diamonds, aes(x = clarity, y = carat, color = price)) +
  geom_point(alpha = 0.2) + theme_classic() +
  scale_color_viridis_c(option = "E", direction = -1)

ggplot(diamonds, aes(x = clarity, y = carat, color = price)) +
  geom_point(alpha = 0.2) + theme_classic() +
  scale_color_viridis_c(option = "E", direction = -1)

#for bins of continuous data use _b INSTEAD
ggplot(diamonds, aes(x = clarity, y = carat, color = price)) +
  geom_point(alpha = 0.2) + theme_classic() +
  scale_color_viridis_b(option = "C", direction = -1)

#ordinal discrete sequential
ggplot(diamonds, aes(x = cut, y = carat, fill = color)) +
  geom_boxplot() + theme_classic() +
  ggtitle("Diamond Quality by Cut") +
  scale_fill_viridis_d("color")

#scale color is for color and scale_fill is for the fill
ggplot(diamonds, aes(x = cut, y = carat, color = color)) +
  geom_boxplot() + theme_classic() +
  ggtitle("Diamond Quality by Cut") +
  scale_color_viridis_d("color")

#heres how it looks on a bar plot
ggplot(diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5)) +
  scale_fill_viridis_d("cut", option = "B") +
  theme_classic()

#from RColorBrewer
display.brewer.all(colorblindFriendly = TRUE)
#PuRd from ^^^
ggplot(diamonds, aes(x= cut, y=carat, fill = color)) +
  geom_boxplot() + theme_classic() +
  ggtitle("Diamond Quality by Cut") +
  scale_fill_brewer(palette = "PuRd")

#from RColorBrewer
ggplot(iris,
       aes(x= Sepal.Length, y=Petal.Length, fill= Species)) +
  geom_point(shape=24, color="black", size = 4) + theme_classic() +
  ggtitle("Sepal and Petal Length of Three Iris Species") +
  scale_fill_brewer(palette = "Set2")

#from ggthemes package
library(ggthemes)
ggplot(iris,
       aes(x= Sepal.Length, y=Petal.Length, color= Species)) +
  geom_point() + theme_classic() + #default shape is geom_point
  ggtitle("Sepal and Petal Length of Three Iris Species") +
  scale_color_colorblind("Species") +
  xlab("Sepal Length in cm") +
  ylab("Petal Length in cm")

#manual palette design, another version of the same colorblind palette

cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442")
names(cb)
cbPalette <- cbPalette[1:length(levels(iris$Species))]

ggplot(iris,
       aes(x= Sepal.Length, y=Petal.Length, color= Species)) +
  geom_point() + theme_classic() + #default shape is geom_point
  ggtitle("Sepal and Petal Length of Three Iris Species") +
  scale_color_manual(values = cbPalette) +
  xlab("Sepal Length in cm") +
  ylab("Petal Length in cm")

#Diverging discrete from RColorBrewer
myiris <- iris %>% group_by(Species) %>% mutate(size= case_when(
  Sepal.Length > 1.1* mean(Sepal.Length) ~ "very large",
  Sepal.Length > 0.9* mean(Sepal.Length) ~ "very small", 
  Sepal.Length > 0.94* mean(Sepal.Length) ~ "small",
  Sepal.Length > 1.06* mean(Sepal.Length) ~ "large",
  T ~ "average"
))

myiris$size <- factor(myiris$size, levels = c(
  "very small", "small","average", "large", "very large"
))

ggplot(myiris, aes(x=Petal.Width, y=Petal.Length, color = size)) +
  geom_point(size = 2) + theme_gray() +
  ggtitle("Diamond Quality by Cut") +
  scale_color_brewer(palette = "RdYlBu")

##Section 3: Non visual representations
mybarplot <- ggplot(diamonds, aes(x = clarity)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 70, vjust = 0.5)) +
  theme_classic() + ggtitle("Number of Diamonds by Clarity")
mybarplot

install.packages("BrailleR")

install.packages("sonify")
library(BrailleR)

VI(mybarplot)

library(sonify)
plot(iris$Petal.Width)
sonify(iris$Petal.Length)

detach("package:BrailleR", unload = TRUE)

plot.diamonds <- ggplot(diamonds, aes(clarity, fill= cut)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust = 0.5))

plot.cars <- ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl))) +
  geom_point(size=2.5)

plot.iris <- ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, fill= color)) +
  geom_point(size=3, alpha=0.7, shape=21)

panel_plot <- plot_grid(plot.cars, plot.iris, plot.diamonds,
                        labels=c("A","B","C"), ncol=2, nrow = 2)

install.packages("cowplot")
library(cowplot)

# make a few plots:
plot.diamonds <- ggplot(diamonds, aes(clarity, fill = cut)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5))
#plot.diamonds

plot.cars <- ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl))) + 
  geom_point(size = 2.5)
#plot.cars

plot.iris <- ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, fill=Species)) +
  geom_point(size=3, alpha=0.7, shape=21)
#plot.iris

# use plot_grid
panel_plot <- plot_grid(plot.cars, plot.iris, plot.diamonds, labels=c("A", "B", "C"), ncol=2, nrow = 2)

panel_plot


