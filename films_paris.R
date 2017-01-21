################ PROJECT ######################

# Import of the CSV file
films_paris = read.csv("/Users/eier/Documents/INSA/5eme ann??e/BigData/Project/bigDataAnalysis/tournagesdefilmsparis2011.csv", sep=";")

# install ggplot2
install.packages("ggplot2")
require(ggplot2) 

# require ddply
library(plyr)

head(films_paris)
# display values per type (~per column)
str(films_paris)
# display all column names
names(films_paris)
# display infos about each column (length, type of entry, etc.)
summary(films_paris)

# Finding the number of films by each director
films_paris$number = 1 # Adding value to sumarize by 
director=ddply(films_paris,"realisateur",summarize,numberFilms=sum(number))

# Finding the top 15 directors (ranged by the number of films)
mostFilms=arrange(director, -numberFilms)[1:15,]
ggplot(director,aes(x=realisateur,y=numberFilms)) + geom_histogram(stat="identity")
ggplot(mostFilms,aes(x=realisateur,y=numberFilms)) + geom_histogram(stat="identity")

# Finding the year when the number of films where the highest
films_paris$year = format(as.Date(as.character(films_paris$date_debut_evenement)),'%Y') # Creating a value that contains the year and not the date.
year=ddply(films_paris, "year", summarize, numFilmsPerYear=sum(number))
ggplot(year,aes(x=year,y=numFilmsPerYear)) + geom_histogram(stat="identity")