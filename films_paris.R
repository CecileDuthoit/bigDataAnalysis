# parser CSV
filmsData <- read.csv("/home/cecile/Documents/INSA/Big Data/Analysis/bigDataAnalysis/tournagesdefilmsparis2011.csv", sep=";")

# install ggplot2
install.packages("ggplot2")
require(ggplot2) 

# require ddply
library(plyr)

head(filmsData)
# display values per type (~per column)
str(filmsData)
# display all column names
names(filmsData)
# display infos about each column (length, type of entry, etc.)
summary(filmsData)