library(fresh)

create_theme(
  
  adminlte_color(
    light_blue = "darkblue"), # header color
  
  adminlte_global(
    content_bg = "lightpink"),
  
  adminlte_sidebar(
    width = "400px",
    dark_bg = "lightblue", # background color
    dark_hover_bg = "magenta",
    dark_color = "red"),
  
  output_file = here::here("shiny-dashboard", "www", "dashboard-fresh-theme.css")
  
)