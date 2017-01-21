################ PROJECT ######################

# Import of the CSV file
films_paris = read.csv("/home/cecile/Documents/INSA/Big Data/Analysis/bigDataAnalysis/tournagesdefilmsparis2011.csv", sep=";")

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
director=ddply(films_paris,"realisateur",summarize,"Number of films by director"=sum(number))
allFilmsByDirector = ggplot(director,aes(x=realisateur,y=`Number of films by director`)) + geom_histogram(stat="identity")
allFilmsByDirector + labs(x = "Directors")

# Finding the top 5 directors (ranged by the number of films)
mostFilms=arrange(director, -`Number of films by director`)[1:5,]
top5directors = ggplot(mostFilms,aes(x=realisateur,y=`Number of films by director`)) + geom_histogram(stat="identity")
top5directors + labs(x = "Directors")

# Finding the year when the number of films where the highest
films_paris$year_beginning = format(as.Date(as.character(films_paris$date_debut_evenement)),'%Y') # Creating a value that contains the year and not the date.
films_paris$year_end = format(as.Date(as.character(films_paris$date_fin_evenement)),'%Y') # Creating a value that contains the year and not the date.
year=ddply(films_paris, "year", summarize, "Number of films per year"=sum(number))
ggplot(year,aes(x=year,y=`Number of films per year`)) + geom_histogram(stat="identity")



