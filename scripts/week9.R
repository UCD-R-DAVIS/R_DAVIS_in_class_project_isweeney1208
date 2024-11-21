Week 9 Work

#iteration - learning objectives
# Understand when and why to iterate code
# Be able to start with a single use and build up to iteration
# Use for loops and map functions to iterate

head(iris)
head(mtcars)

#subsetting refresher
iris[1]
iris[[1]]

iris$Sepal.Length

iris[,1]
iris[1,1]

#for loops
#when you want to do somewthing down rows of data
# takes an index value and runs it through your function
# layout: use of i to specify index value (although you could use any value here)

for(i in 1:10){
  print(i)
}

for(i in 1:10){
  print(iris$Sepal.Length[i])
}


head(iris$Sepal.Length, n = 10)

for(i in 1:10){
  print(iris$Sepal.Length[i])
  print(mtcars$mpg[i])
}

# store output
results <- rep(NA, nrow(mtcars))
results

for(i in 1:nrow(mtcars)){
  results[i] <- mtcars$wt[i] * 100
}

results

mtcars$wt

#Map family of functions
# map functions are useful when you want to do something across multiple column
library(tidyverse)

# two arguments: the data and the function
map(iris, mean)
map_df(iris,mean)

head(mtcars)

print_mpg <- function(x, y) {
  paste(x, "gets", y, "miles per gallon")
}

# map2_chr(input1, input2, function)
map2_chr(rownames(mtcars), mtcars$mpg, print_mpg)


#embed "anonymous" function
map2_chr(rownames(mtcars), mtcars$mpg, function(x, y)
  paste(x, "gets", y, "miles per gallon")
)