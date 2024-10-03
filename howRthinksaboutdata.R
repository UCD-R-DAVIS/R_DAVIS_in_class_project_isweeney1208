weight_g <- c(50,60,65,82)
weight_one_value <- c(50)

animals <- c("mouse", "rat", "dog")
animals
#inspection -----
length(weight_g)
str(weight_g)

#change vectors----
weight_g <- c(weight_g, 90)

num_char <- c(1,2,3, "a")
num_logical <- c(1,2,3,TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1,2,3,"4")

class(num_char)
class(num_logical)
class(char_logical)
class(tricky)
#subsetting ---- 
animals <- c("mouse", "rat", "dog", "cat")
animals

animals [c(2,3)]

#conditional setting ----
weight_g <- c(21, 34, 39, 54, 55)
weight_g > 50
weight_g [weight_g > 50]

#symbols ----
#%in%
animals %in% c("rat","cat","dog","duck", "goat")
animals == c("rat","cat","dog","duck", "goat")
