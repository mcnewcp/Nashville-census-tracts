# Nashville-census-tracts
Census polygons of Nashville (Davidson County) for use in R.

## Description
This script uses the [tigris](https://github.com/walkerke/tigris) package to download various census polygon data, filter to Davidson County TN, and save as a named list RDS.  My intention with this script is to store this information for quick and easy access elsewhere.

## Polygons
The polygon types saved in the current version are:
- census tracts
- census block groups
- voting disctricts
