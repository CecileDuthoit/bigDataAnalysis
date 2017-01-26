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

# Finding top 5 directors
films_paris$number = 1 # Adding value to sumarize by 
director=ddply(films_paris,"realisateur",summarize,"Number of films by director"=sum(number))
mostFilms=arrange(director, -`Number of films by director`)[1:5,]
top5directors = ggplot(mostFilms,aes(x=realisateur,y=`Number of films by director`)) + geom_histogram(stat="identity")
top5directors = top5directors + labs(x = "Directors")
top5directors + theme(axis.title.x = element_text(size = rel(2))) + theme(axis.title.y = element_text(size = rel(2))) + theme(axis.text = element_text(size = rel(1.5)))

# Finding the year when the number of films where the highest
films_paris$year = as.Date(as.character(films_paris$date_debut_evenement), format='%Y') # Creating a value that contains the year and not the date.
films_paris$year = format(films_paris$date_debut_evenement, '%Y')
year = ddply(films_paris, "year", summarize, "Number of films per year"=sum(number))
years = ggplot(year,aes(x=year,y=`Number of films per year`)) + geom_histogram(stat="identity")
years + labs(x = "Year") + labs(y = "Number of films") + theme(axis.title.x = element_text(size = rel(2))) + theme(axis.title.y = element_text(size = rel(2))) + theme(axis.text = element_text(size = rel(1.5)))

# Finding the top 15 districts
films_paris$number = 1 # Adding value to sumarize by 
shotDistricts_per_placeType = ddply(films_paris,c("arrondissement", "cadre"),summarize,"Number of films per district"=sum(number))
mostDistricts = arrange(shotDistricts_per_placeType, -`Number of films per district`)[1:10,]
top5shotDistricts = ggplot(mostDistricts,aes(x=arrondissement,y=`Number of films per district`)) + geom_histogram(stat="identity", position = "dodge") 
top5shotDistricts + labs(x = "Districts") + theme(axis.title.x = element_text(size = rel(2))) + theme(axis.title.y = element_text(size = rel(2))) + theme(axis.text = element_text(size = rel(1.5)))

# Import of an "home-made" CSV file about the number of nights reserved in Paris 
tourism_paris = read.csv("/home/cecile/Documents/INSA/Big Data/Analysis/bigDataAnalysis/tourism_evolution.csv", sep=";")

# Plot the evolution of tourism in Paris
tourism_paris$tmp = as.Date(as.character(tourism_paris$Year), format='%Y')
tourism_paris$tmp = format(tourism_paris$tmp, '%Y')
evolution = ggplot(tourism_paris,aes(x=tmp,y=nights)) + geom_histogram(stat="identity", position = "dodge")
evolution + labs(x = "Year") + labs(y = "Millions of reserved nights") + theme(axis.title.x = element_text(size = rel(2))) + theme(axis.title.y = element_text(size = rel(2))) + theme(axis.text = element_text(size = rel(1.5)))





