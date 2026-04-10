library(shiny)
library(bslib)
library(bsicons)

ui <- page_navbar(
  title = "Fish Creek Watershed Lake Monitoring",
  id = "navbar",
  
  # Welcome page
  nav_panel(
    title = "Welcome",
    icon = bs_icon("house"),
    layout_columns(
      col_widths = c(6, 6),
      
      # Left column - Monitoring box
      card(
        card_header(
          class = "d-flex align-items-center gap-2",
          bs_icon("droplet-fill"),
          "Monitoring Fish Creek Watershed"
        ),
        card_body(
          p("This is placeholder text describing the Fish Creek Watershed monitoring program. 
            The program collects data on water quality, ecosystem health, and various environmental 
            parameters to ensure the sustainability of this important watershed.")
        )
      ),
      
      # Right column - Two stacked boxes
      layout_columns(
        col_widths = 12,
        
        card(
          card_header(
            class = "d-flex align-items-center gap-2",
            bs_icon("file-text"),
            "Data Citation"
          ),
          card_body(
            p("Placeholder text for data citation information. Please cite this data appropriately 
              when using it in publications or reports. Full citation details will be provided here.")
          )
        ),
        
        card(
          card_header(
            class = "d-flex align-items-center gap-2",
            bs_icon("exclamation-triangle"),
            "Disclaimer"
          ),
          card_body(
            p("Placeholder disclaimer text. The data provided is for informational purposes only. 
              Users should verify information before making critical decisions based on this data.")
          )
        )
      )
    )
  ),
  
  # Dashboard page
  nav_panel(
    title = "Dashboard",
    icon = bs_icon("bar-chart"),
    layout_columns(
      col_widths = c(4, 8),
      
      # Left column - Input box (narrower)
      card(
        card_header("Inputs"),
        card_body(
          p("Input controls will go here")
        )
      ),
      
      # Right column - Output box (wider)
      card(
        card_header("Outputs"),
        card_body(
          p("Visualization outputs will go here")
        )
      )
    )
  )
)
