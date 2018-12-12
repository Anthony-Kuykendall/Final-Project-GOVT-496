library(UScensus2010)
library(UScensus2010tract)
library(sp)
library(maptools)
library(rgeos)
library(ggmap)
library(tidyverse)
data("district_of_columbia.tract10")

## Number of Tracts
n_tract <- length(district_of_columbia.tract10)

## Storage matrix
centers <- matrix(NA, nrow = n_tract, ncol = 2)

## Loop the tracts extract lon and lat
for(i in 1:n_tract){
  this_center <- district_of_columbia.tract10@polygons[[i]]@labpt
  centers[i, ] <- this_center
}

centers <- data.frame(centers)
names(centers) <- c("long", "lat")

## the main code
gg <- ggplot()
gg <- gg + geom_polygon(data = centers, aes (x = long, y = lat),
                        color = "black", fill = NA, size = 0.5)
gg <- gg + geom_point(data = closed_schools, aes(x = Longitude, y = Latitude, color = Designation),
                      na.rm = TRUE)
DCPS_closures <- gg + coord_map()
DCPS_closures
centers

DCSchoolsmap <- get_map("Washington, DC", zoom = 12)
ggmap(DCSchoolsmap)



DC_base <- ggplot(data = centers, mapping = aes(x = long, y = lat)) +
  coord_fixed(1.3) +
  geom_polygon(color = "black", fill = "gray")
DC_base + theme_nothing()

DC_base <- ggplot(data = district_of_columbia.tract10) + 
  geom_polygon(mapping = aes(x = long, y = lat), color = "gray",
                                    fill = NA, size = 0.5)
DCPS_closures <- DC_base + 
  geom_point(data = closed_schools, aes(x = Longitude, y = Latitude, color = Designation),
                     na.rm = TRUE)