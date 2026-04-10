# load pkgs ----
library(arrow)
library(leaflet)
library(tidyverse)

# read in data ----
lake_data <- read_parquet(here::here("shiny-dashboard", "data", "lake_data_processed.parquet"))

# practice filtering ---
filtered_lakes_df <- lake_data %>% 
  filter(Elevation >= 8 & Elevation <= 20) %>% 
  filter(AvgDepth >= 2 & AvgDepth <= 3) %>% 
  filter(AvgTemp >= 4 & AvgTemp <= 6)

# practice building leaflet ----
leaflet() %>% 
  
  # add tiles
  addProviderTiles(provider = providers$Esri.WorldImagery) %>% 
  
  # set view over Alaska
  setView(lng = -152.048442, lat = 70.249234, 
          zoom = 6)  %>% # zoom dictates how close it is to that particular region
  
  # add mini map
  addMiniMap(toggleDisplay = TRUE, # allows for minimization of map
             minimized = FALSE) %>% # not minimized by default
  
  # add markers
  addMarkers(data = filtered_lakes_df,
             lng = filtered_lakes_df$Longitude,
             lat = filtered_lakes_df$Latitude,
             popup = paste0(
               # create popup text
               "Site Name: ", filtered_lakes_df$Site, "<br>",
               "Elevation: ", filtered_lakes_df$Elevation, " meters (above SL)", "<br>",
               "Average Depth: ", filtered_lakes_df$AvgDepth, " meters", "<br>",
               "Average Lake Bed Temperature: ", filtered_lakes_df$AvgTemp, "°C")) # shift + option + 8, or \u00B0C as unicode for deg C
