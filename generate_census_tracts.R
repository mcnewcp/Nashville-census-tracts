### this script uses tigris package to save an RDS of census polygon data for quick loading
### from github
if(!require(pacman)) install.packages('pacman')
p_load(tigris, tidyverse, sf)

#load census tracts for Davidson County, TN
t <- tracts("TN", "Davidson", year = 2019, cb = TRUE) %>%
  rename_all(tolower) %>%
  st_transform(4326) %>% #transform to lat/lon
  mutate(name = paste("Census Tract:", tractce)) %>%
  select(geoid, name)

#load census block groups for Davidson County, TN
bg <- block_groups("TN", "Davidson", year = 2019, cb = TRUE) %>%
  rename_all(tolower) %>%
  st_transform(4326) %>% #transform to lat/lon
  mutate(name = paste("Census Tract:", tractce, "<br/>Census Block Group:", blkgrpce)) %>%
  select(geoid, name)

# #load census blocks for Davidson County, TN
# #this sf is >100 MB
# b <- blocks("TN", "Davidson", year = 2019) %>%
#   rename_all(tolower) %>%
#   st_transform(4326) #transform to lat/lon

#load census block groups for Davidson County, TN
vd <- voting_districts("TN") %>%
  rename_all(tolower) %>%
  filter(countyfp10 == "037") %>%
  st_transform(4326) %>% #transform to lat/lon
  mutate(name = paste("Voting District:", name10)) %>%
  select(geoid10, name)

#write to RDS
write_rds(
  list(tract = t, block_group = bg, voting_district = vd), 
  "Nashville_Census_Polygons_2019.RDS"
)

# #### TEMP CHECK ######
# library(leaflet)
# leaflet(vd) %>%
#   addTiles() %>%
#   addPolygons()
