mapParis <- borders("france","paris", colour="gray50", fill="gray50")
mpP <- ggplot() + mapParis
mpP <- mpP+ geom_point(aes(x=2.352987, y=48.891305) ,color="blue", size=3) # 75018
mpP <- mpP+ geom_point(aes(x=2.3176432, y=48.891305) ,color="blue", size=3) # 75008
mpP <- mpP+ geom_point(aes(x=2.248763, y=48.853093) ,color="blue", size=3) # 75016
mpP <- mpP+ geom_point(aes(x=2.358279, y=48.853428) ,color="blue", size=3) # 75004
mpP <- mpP+ geom_point(aes(x=2.351834, y=48.843491) ,color="blue", size=3) # 75005
mpP <- mpP+ geom_point(aes(x=2.325928, y=48.860198) ,color="red", size=3) # Orsay Museum
mpP <- mpP+ geom_point(aes(x=2.334858, y=48.86273) ,color="red", size=3) # L'Ouvre museum
mpP <- mpP+ geom_point(aes(x=2.29324, y=48.857198) ,color="red", size=3) # The eiffel tower
mpP <- mpP+ geom_point(aes(x=2.349292, y=48.85267) ,color="red", size=3) # Cathedrale Notre Dame
mpP <- mpP+ geom_point(aes(x=2.335422, y=48.848858) ,color="red", size=3) # Jardin du Luxembourg
mpP + labs(x="Paris")
mpP + labs(x = "Coordonnes long") + labs(y = "Coordonnes lat") + theme(axis.title.x = element_text(size = rel(2))) + theme(axis.title.y = element_text(size = rel(2))) + theme(axis.text = element_text(size = rel(1.5)))