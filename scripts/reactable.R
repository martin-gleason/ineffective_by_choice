#reactable
library(tidyverse)
library(reactable)
source(file.path("..", "scripts", "list_to_data_frame_env.R"))
geocoded_dah <- read_rds(file.path("inputs", "geocoded_addreses.rds"))

as_tibble_env(geocoded_dah)
rm(geocoded_dah)

demo_table <- all_addresses_geocoded %>%
  reactable(
    striped = TRUE,
    columns = list(
      docket_number = colDef(name = "Docket Number")),
    theme = reactableTheme(
      stripedColor = "#f6f8fa"
    )
  )
