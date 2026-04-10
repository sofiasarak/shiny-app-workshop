library(fresh)

create_theme(
  
  theme = "default", # theme to build off of
  
  bs_vars_global(
    body_bg = "beige",
    text_color = "hotpink",
    link_color = "royalblue",
  ),
  
  bs_vars_navbar(
    default_bg = "limegreen",
    default_color = "gray",
  ),
  
  bs_vars_tabs(
    border_color = "red"
  ),
  
  # save the styling file in the www folder
  output_file = here::here("two-file-app", "www", "app-fresh-theme.css")
  
  
)
