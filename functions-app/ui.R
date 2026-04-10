ui <- fluidPage(
  
  tags$h1("Demoing Functions"),
  
  # tabsetPanel ----
  tabsetPanel(
    
    # scatterplot tab ----
    tabPanel(title = "Scatterplot",
             
             # species (scatterplot) pickerInput ----
             penguin_spp_pickerInput(inputId = "penguin_spp_scatterplot_input"),
             
             # scatterplot output ----
             plotOutput(outputId = "penguin_scatterplot_output")
             
    ), # END scatterplot tab
    
    
    # histogram tab ----
    tabPanel(title = "Histogram",
             
             # species (histogram) pickerInput ----
             penguin_spp_pickerInput(inputId = "penguin_spp_histogram_input"),
             
             # do not need to reference function because it is in a folder called R
             # makes code more readable b/c function tells us what the input is selecting!
             
             # scatterplot output ----
             plotOutput(outputId = "penguin_histogram_output")
             
    ) # END histogram tab
    
  ) # END tabsetPanel
  
) # END fluidPage