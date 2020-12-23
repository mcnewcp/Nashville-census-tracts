### this script reads in the TN census tract shapefile from census.gov and generates a
### simplified rds of Davidson County for use in R elsewhere
### raw data is downloaded from https://www.census.gov/cgi-bin/geo/shapefiles/
if(!require(pacman)) install.packages('pacman')
p_load(tidyverse, sf)

mapSF <- st_read(file.path("tl_2019_47_tract", "tl_2019_47_tract.shp")) %>%
  rename_all(tolower) %>%
  filter(countyfp == "037") %>% #filter to Davidson County
  st_transform(4326) %>% #transform all to lat/lon
  select(geoid, census_tract = name) 

write_rds(mapSF, "Nashville_Census_Tracts_2019.RDS")
