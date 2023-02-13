library(gt)
library(reactable)
library(tidyverse)
library(leaflet)
library(mapboxapi)



geocoded_dah <- read_rds(file.path("inputs", "geocoded_addreses.rds"))
list2env(set_names(geocoded_dah, names(geocoded_dah)), .GlobalEnv)

glimpse(missing_geocode)

#transfomr into fucntion
x <- tidygeocoder::geo("4501 W 42nd Pl, Chicago, IL 60632")

kronos_prodcuts <- tibble(name = "KRONOS PRODUCTS", lat = x$lat, long = x$long)


missing_geocode %>%
  filter(respondent_full_name != "KRONOS PRODUCTS") %>%
  glimpse() %>%
  View()


x <- tidygeocoder::geo("5335 W CHICAGO Ave, Chicago, il, 60651")

gas_pantry <- tibble(name = "H AND E GAS AND PANTRY", lat = x$lat, long = x$long)


geo_fix <- function(name, fixed_address, fixed_city = "Chicago", zip = NULL...) {
  new_coords = tidygeocoder::geo(address = glue::glue(fixed_address, 
                                                      fixed_city, 
                                                      .sep = ", "))
  return(new_coords)
}

test <- test %>% 
  bind_rows(geo_fix("MONTROSE CEMETERY CO", "5400 N Pulaski Rd"))
test_two <- geo("5400 N Pulaski Rd")

##
MANEYSKI_CONSTRUCTION <- geo("1430 N LAKE SHORE DR")


