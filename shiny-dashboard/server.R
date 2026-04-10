server <- function(input, output){
  
  # filter lake data ----
  filtered_lakes_df <- reactive({
    
    filtered_lakes_df <- lake_data %>%  # add reactive inputs into filter statement
      filter(Elevation >= input$elevation_slider_input[1] & Elevation <= input$elevation_slider_input[2]) %>% 
      filter(AvgDepth >= input$depth_slider_input[1] & AvgDepth <= input$depth_slider_input[2]) %>% 
      filter(AvgTemp >= input$temp_slider_input[1] & AvgTemp <= input$temp_slider_input[2])
    
  })
  
  
  # build leaflet map ----
  
  output$lake_map_output <- renderLeaflet({
    
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
      addMarkers(data = filtered_lakes_df(),
                 lng = filtered_lakes_df()$Longitude,
                 lat = filtered_lakes_df()$Latitude,
                 popup = paste0(
                   # create popup text
                   "Site Name: ", filtered_lakes_df()$Site, "<br>",
                   "Elevation: ", filtered_lakes_df()$Elevation, " meters (above SL)", "<br>",
                   "Average Depth: ", filtered_lakes_df()$AvgDepth, " meters", "<br>",
                   "Average Lake Bed Temperature: ", filtered_lakes_df()$AvgTemp, "°C")) # shift + option + 8, or \u00B0C as unicode for deg C
    
  })
  
  
  
}