# install.packages("maps")
require(ggplot2) 
require(maps)
require(plyr)

# Import the paris airbnb listing
paris_airbnb = read.csv("paris-airbnb-listings.csv", sep=";")
create_airbnb <- function() {
  p = paris_airbnb
  p$Year = format(as.Date(as.character(p$Last.Review), format="%Y-%m-%d"), "%Y")
  p = dplyr::filter(p, Year > 2013)
  p = ddply(p, .(Neighbourhood), summarise, lat=mean(Latitude), long=mean(Longitude), count=sum(Year > 2013, rm.na=TRUE))
  p = arrange(p, -count)
  head(p)
  return(p)
}

data = create_airbnb()
mapParis <- borders("france","paris", colour="gray50", fill="white")
ggplot() + mapParis + 
  labs(x="", y="", title="Number of airbnb reservations (2013-2016)")+ #labels
  theme(axis.ticks.y = element_blank(),axis.text.y = element_blank(), 
        axis.ticks.x = element_blank(),axis.text.x = element_blank(), 
        plot.title = element_text(lineheight=.8, face="bold", vjust=1))+ 
  geom_point(aes(x=long, y=lat, color=count, size=count), colour="gray", shape=21, stroke=2, data=data, alpha=1) +
  geom_point(aes(x=long, y=lat, color=count, size=count), data=data, alpha=1) +
  geom_text(aes(x=long, y=lat, label=Neighbourhood),data=data, hjust=0.5, vjust=0) +
  scale_size_continuous(range = c(5, 50), guide="none") +
  scale_colour_gradientn("Number of\nReservations", colours=c( "#ffff00","#ff0000"))