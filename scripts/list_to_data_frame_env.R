#list to data frame in environment

as_tibble_env <- function(list){
  list2env(set_names(list, names(list)), .GlobalEnv)
}

