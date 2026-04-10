# ---- dashboard header ----
header <- dashboardHeader(
  
  # title ----
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400 # adjust width of title box, ensuring complete text fits
  
)

# --- dashboard sidebar ----
sidebar <-  dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "Welcome", 
             tabName = "welcome", # identifier, how content will be linked
             icon = icon("star")), # from font awesome library
    
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

# ---- dashboard body ----
body <- dashboardBody(
  
  tabItems(
    
    # welcome tabItem ----
    tabItem(
      
      tabName = "welcome", # will know that everything I build here should show up on welcome tab above
      
      # left-hand column ----
      column(
        
        width = 6,
        
        # background box
        box(width = NULL, # tells it to inheret the width of the column
            
            title = tagList(icon("water"), strong("Monitoring Fish Creek Watershed")),
            
            includeMarkdown("text/intro.Rmd"),
            tags$img(src = "map.jpg",
                     alt = "A map of northern Alaska, showing Fish Creek Watershet located within the National Petroleum Preserve.",
                     style = "max-width: 100%"),
            tags$p(tags$em("Map Source: ", 
                           tags$a(href = "http://wwwfishcreekwatershed.org/", "FCWO")), # p refers to plain body text, em is italics, a is hyperlinks
                          style = "text-align: center;")
            )  # END background box
        
        ), # END lefthand column
      
      # right-hand column ----
     column(width = 6,
            
            # data source box ----
            box(width = NULL,
                
                title = tagList(icon("table"), strong("Data Citation")),
               
                includeMarkdown("text/citation.Rmd") 
                
                ), # END data source box
            
            box(width = NULL, # because the other box assumes width = 6, the only other place for this one to go is stacked below
                
                title = tagList(icon("triangle-exclamation"), strong("Disclaimer")),
                
                includeMarkdown("text/disclaimer.Rmd")
                
                ) # END disclaimer box
            
            
            ) # END right-hand column
      
    ), # END welcome tabItem
    
    # dashboard tabItem ----
    tabItem(
      
      tabName = "dashboard",
      
      # input box ----
      box(
        
        width = 4, # screens are broken up into units of 12, so this is always out of 12
        
        title = tags$strong("Adjust lake parameter ranges:"), # strong = bold
        
        # sliderInputs ---- 
        sliderInput(inputId = "elevation_slider_input",
                    label = "Elevation (meters above SL):",
                    min = min(lake_data$Elevation),
                    max = max(lake_data$Elevation),
                    value = c(min(lake_data$Elevation), max(lake_data$Elevation)) # default
        ),
        
        sliderInput(inputId = "depth_slider_input",
                    label = "Depth (meters): ",
                    min = min(lake_data$AvgDepth),
                    max = max(lake_data$AvgDepth),
                    value = c(min(lake_data$AvgDepth), max(lake_data$AvgDepth))
        ),
        
        sliderInput(inputId = "temp_slider_input",
                    label = "Average Lake Bed Temperature (°C): ",
                    min = min(lake_data$AvgTemp),
                    max = max(lake_data$AvgTemp),
                    value = c(min(lake_data$AvgTempt), max(lake_data$AvgTempt)))
        
      ), # END input box
      
      # leaflet box ----
      box(
        
        width = 8,
        
        leafletOutput(outputId = "lake_map_output") %>% 
          withSpinner(type = 4,
                      color = "cornflowerblue")
        
         # END leaflet box
      )
      
    ) # END dashboard tabItem
    
  ) # END tabItems
  
) # END dashboardBody

# --- combine all into dashboardPage ----
dashboardPage(header, sidebar, body)