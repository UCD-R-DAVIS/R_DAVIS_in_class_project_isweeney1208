#dataframes
letters
data.frame(letters)
df <- data.frame(letters)
length(df)
dim(df)
nrow(df)

as.data.frame(t(df))

ncol(df)

#factors
animals <- factor(c("chicken","duck","duck","goose","goose","pig"))
animals
class(animals)
levels(animals)
nlevels(animals)

animals <- factor(x = animals, levels = c("goose", "pigs", "duck") )
animals

year <- factor(c(1978, 1980, 1934, 1979))
year

class(year) #says its a factor
as.numeric(year) #lists it as order of year
levels(year) #lists years in order


