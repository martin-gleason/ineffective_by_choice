#cleaning and accessing data
library(tidyverse)
library(googlesheets4)
library(janitor)
library(tidygeocoder)

url <- "https://docs.google.com/spreadsheets/d/1eFMsf0QYA7TUjed_ZzPztM5wGCo-pz5GAECQy_8dpIo/edit#gid=1507503351"
dah_enviorment_violations <- read_sheet(url) %>%
  clean_names()

unique_dockets <- dah_enviorment_violations$docket_number %>% unique()

nrow(dah_enviorment_violations)
length(unique_dockets)

glimpse(dah_enviorment_violations)

respondants <- dah_enviorment_violations$respondent_full_name %>% 
  unique() %>% 
  length()

test_geo <- dah_enviorment_violations %>%
  mutate(city = "Chicago") %>%
  geocode(street = violation_address,
          city = city)

missing_add <- test_geo %>%
  filter(is.na(lat))

nrow(missing_add)/nrow(test_geo)

geo_coded_dfs <- list(all_addresses_geocoded = test_geo, missing_geocode = missing_add)

write_rds(geo_coded_dfs ,file.path("inputs", "geocoded_addreses.RDS"))
#list2env(set_names(sqrp, names(sqrp)), .GlobalEnv)
