# ---- user interface ---- anything that I want to end up on the website needs to live in ui
ui <- navbarPage( # similar to fluidpage but adds a navbar at the top
  
  # title
  title = "LTER Animal Data Explorer",
  
  # (Page 1) intro tabPanel
  tabPanel(title = "About this App",
           
           # intro text fluidRow ----
           fluidRow(
             
            column(1), # add empty columns as buffers for spacing 
            column(10, includeMarkdown("text/about.md")),
            column(1)
             
           ), # END intro text fluidRow
           
           hr(), # adds gray horizontal line as visual break
           
           includeMarkdown("text/footer.md") # don't need to define explicit rows because we want footer to run across entire page
           
  ), # END (Page 1) intro tabPanel
  
  # (Page 2) data tabPanel ----
  
## START TROUT TAB

  tabPanel(title = "Explore the Data",
           
           # tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tabPanel ----
             tabPanel(
               
               title = "Trout",
               
               # trout sidebarLayout ----
               sidebarLayout(
                 
                 # trout sidebarPanel ---
                 sidebarPanel(
                   
                   # channel type pickerinput ---
                   pickerInput(inputId = "channel_type_input",
                               label = "Select channal type(s):",
                               choices = unique(clean_trout$channel_type),
                               selected = c("cascade", "pool"),
                               multiple = TRUE, # allows for selection of multiple options at a time
                               options = pickerOptions(actionsBox = TRUE) # gives the option of selecting all or deselecting all
                                 ), # END channel type picker input
                   
                   # section checkboxGroupButtons ----
                   checkboxGroupButtons(inputId = "section_input",
                                        label = "Select a sampling section(s):",
                                        choices = c("clear cut forest", "old growth forest"),
                                        selected = c("clear cut forest", "old growth forest"),
                                        justified = TRUE, # stretch to size of sidebar panel
                                        checkIcon = list(yes = icon("check", lib = "font-awesome"), # icon for when button is clicked
                                                         no = icon("xmark", lib = "font-awesome")))
              
                   
                 ), # END trout sidebarPanel
                 
                 # trout mainPanel ----
                 mainPanel(
                   
                   plotOutput(outputId = "trout_scatterplot_output") %>% 
                     
                     withSpinner(color = "cornflowerblue", # there's a demo app that shows you all of these options!
                                 type = 4, # (adds spinner to show that data is loading)
                                 size = 2)
                   
                 ) # END trouth mainPanel
                 
               ) # END trout sidebar layout
               
             ), # END trout tabPanel
             
             
## START PENGUINS TAB
             
             tabPanel(
               
               title = "Penguins",
               
               # penguins sidebarLayout ----
               sidebarLayout(
                 
                 # penguins sidebarPanel ---
                 sidebarPanel(
                   
                   # penguins island selection picker
                   pickerInput(input = "penguin_island_input",
                               label = "Select island(s):",
                               choices = unique(penguins$island),
                               selected = c("Biscoe", "Dream"),
                               multiple = TRUE,
                               options = pickerOptions(actionsBox = TRUE) # gives option to select all or none
                    ), # END island picker
                   
                   sliderInput(inputId = "histogram_bin_slider_input",
                               label = "Choose the number of bins:",
                               min = 1, max = 100,
                               value = 25)
                   
                 ), # END penguin sidebarPanel
                 
                 # penguins mainPanel ----
                 mainPanel(
                   
                   plotOutput(outputId = "penguin_flipper_length_plot") %>% 
                     withSpinner(color = "cornflowerblue", # there's a demo app that shows you all of these options!
                                 type = 4,
                                 size = 2)
                   
                 ) # END penguin mainPanel
                 
               ) # END penguin sidebar layout
             ) # END penguins tabPanel
             
           ) # END tabsetPanel
           
  ), # END (Page 2) data tabPanel
  
) # END navbarPage