
#demo_map
library(leaflet)
library(mapboxapi)

source(file.path("scripts", "list_to_data_frame_env.R"))
geocoded_dah <- read_rds(file.path("inputs", "geocoded_addreses.rds"))

as_tibble_env(geocoded_dah)
rm(geocoded_dah)

addresses_sf <- all_addresses_geocoded %>% 
  filter(!is.na(lat)) %>%
  st_as_sf(coords = c("lat", "long"), crs = 4326)

city_icon <- makeAwesomeIcon(icon = "landmark", library = "fa",
                             iconColor = "white")

leaflet() %>%
  setView(-87.6715046, 
          41.826966371014564, 
          zoom =10) %>%
  addAwesomeMarkers(lng = -87.6715046, 
                    lat = 41.826966371014564,
                    icon = city_icon) %>%
  addMapboxTiles(username = "mapbox",
                 style_id = "outdoors-v12")

