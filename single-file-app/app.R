# ---- load pkgs ----
library(shiny)
library(tidyverse)
library(palmerpenguins)

# --- user interface ----
ui <- fluidPage(
  
  # app title
  tags$h1("My App Title"), # various tags that correspond to different html elements
  
  # app subtitle
  h2(strong("Exploring Antarctic Penguin Data")), # function that actually establishes user interface (sets basic webpage structure)

# body mass slider input
  sliderInput(inputId = "body_mass_input", # this id is what goes into plots, etc.
              label = "Select a range of body masses (g)",
              min = 2700, max = 6300, value = c(3000, 4000)), # value represents starting value, and providing a vector creates a range

# outputs in the UI create placeholders which are later filled by the server function

  # body mass plot output
  plotOutput(outputId = "body_mass_scatterplot_output") # does not change in UI

# each output in the UI is paired with its own render function (in server)
)

# ---- server ----
server <- function(input, output){
  
  # filter body masses (need to create dataframe that then gets filtered into our plot)
  body_mass_df <- reactive({ # this function tells it that the df is reactive
    
    penguins %>% 
      filter(body_mass_g %in% c(input$body_mass_input[1]:input$body_mass_input[2]))
    
  })
  
  # there are different, specific render functions for different output elements
  output$body_mass_scatterplot_output <- renderPlot({
    
    # ---- code to create scatterplot ----
    ggplot(na.omit(body_mass_df()), # every time you call a reactive dataframe, you have to open up a set of () at the end 
           aes(x = flipper_length_mm, y = bill_length_mm, 
               color = species, shape = species)) +
      geom_point() +
      scale_color_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)", y = "Bill length (mm)", 
           color = "Penguin species", shape = "Penguin species") +
      guides(color = guide_legend(position = "inside"),
             size = guide_legend(position = "inside")) +
      theme_minimal() +
      theme(legend.position.inside = c(0.85, 0.2), 
            legend.background = element_rect(color = "white"))
    
  }
  )
  
  
}

# ---- combine ui & server into an app ----
shinyApp(ui = ui, server = server)