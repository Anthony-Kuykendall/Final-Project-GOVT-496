library(tidyverse)
library(maps)

# Process of creating a DC and DC surrounding area map.
states <- map_data("state")
DMV_area <- subset(states, region %in% c("maryland", "virginia", "district of columbia"))
DC_map <- subset(states, region %in% c("district of columbia"))
counties <- map_data("county")
DC_wards <- subset(counties, region == "district of columbia")


DCmap <- ggplot(data = DC_map) +
  geom_polygon(aes(x = long, y = lat, group = group), fill = "grey", color = "black") +
  coord_fixed(1.3)
DC_map

map_dataDC <- closed_schools %>% 
  inner_join(DC_map, by = c(Longitude = "long", Latitude = "lat"))

PubSchoolLocation <- ggplot(ddata = map_dataDC) +
  geom_polygon(aes(x = Longitude, y = Latitude, group = group), fill = "grey", color = "black") +
  geom_point()
PubSchoolLocation

# Will this be the final product?
DCmap <- ggplot(data = DC_map) +
  geom_polygon(aes(x = long, y = lat, group = group), fill = "grey", color = "black") +
  coord_fixed(1.3)
plot(DC_map, xlim = c(-77.2, -76.8), ylim = c(38.6, 39), asp = 1)
points(closed_schools$Longitude, closed_schools$Latitude, col = "red", cex = .6)

plot(DCmap)
points(closed_schools$Longitude, closed_schools$Latitude, col = "red", cex = .6)

# DC Plotting Notation Revisited I think this one might be a little hard to track.
gg <- ggplot()
gg <- gg + geom_polygon(data = DC_map, aes (x = long, y = lat, group = group, fill = NA),
                        color = "black", fill = NA, size = 0.5)
gg <- gg + geom_point(data = closed_schools, aes(x = Longitude, y = Latitude, color = Designation),
                      na.rm = TRUE)
DCPS_closures <- gg + coord_map()
DCPS_closures
