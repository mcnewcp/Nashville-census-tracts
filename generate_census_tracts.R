### this script uses tigris package to save an RDS of census polygon data for quick loading
### from github
if(!require(pacman)) install.packages('pacman')
p_load(tigris, tidyverse, sf)

#load census tracts for Davidson County, TN
t <- tracts("TN", "Davidson", year = 2019) %>%
  rename_all(tolower) %>%
  st_transform(4326) %>% #transform to lat/lon
  select(geoid, census_tract = name)

#write to RDS
write_rds(t, "Nashville_Census_Tracts_2019.RDS")

# #### TEMP CHECK ######
# library(leaflet)
# leaflet(t) %>%
#   addTiles() %>%
#   addPolygons()
