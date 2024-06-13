ui <- navbarPage(
  
  title = "Palmer Penguins Data Explorer",
  
  # (Page 1) intro tabPanel ----
  tabPanel(title = "About this App",
           
           # intro text fluidRow ----
           fluidRow(
             
             # use columns to create white space on sides
             column(1),
             column(10, includeMarkdown("text/about.md")),
             column(1)
             
           ), # END intro text fluidRow
           
           fluidRow(
             
             ## create column with leaflet output
             column(2),
             column(8, leafletOutput(outputId = "palmer_station_map")),
             column(2)
           )
           
           
  ), # END (Page 1) intro tabPanel
  
  
  
  # (Page 2) data viz sidebalLayout ----
  tabPanel(title = "Explore the Data",
           
           fluidPage(
             
             h4("Penguin plot 1"),
             
             # penguin plot sidebarLayout ----
             sidebarLayout(
               
               # penguin plot sidebarPanel ----
               sidebarPanel(
                 
                 # island pickerInput ----
                 pickerInput(inputId = "penguin_island_input", label = "Select an island(s):",
                             choices = c("Torgersen", "Dream", "Biscoe"),
                             selected = c("Torgersen", "Dream", "Biscoe"),
                             options = pickerOptions(actionsBox = TRUE),
                             multiple = TRUE), # END island pickerInput
                 
                 # bin number sliderInput ----
                 sliderInput(inputId = "bin_num_input", label = "Select number of bins:",
                             value = 25, max = 100, min = 1), # END bin number sliderInput
                 
               ), # END penguin plot sidebarPanel
               
               # penguin plot mainPanel ----
               mainPanel(
                 
                 plotOutput(outputId = "flipperLength_histogram_output") 
                 
               ) # END penguin plot mainPanel
               
             ), # END penguin plot sidebarLayout
             
             # Penguin table title ----
             h4("Penguin Complete Data"),
             
             # penguin table sidebarLayout ----
             sidebarLayout(
               
               # penguin table sidebarPanel ----
               sidebarPanel(
                 
                 # year checkbox input ----
                 checkboxGroupInput(inputId = "year_select", 
                                    label = "Select year(s)" ,
                                    choices = c(2007, 2008, 2009),
                                    selected = c(2007, 2008)), # END checkbox input
                 
               ), # END penguin table sidebarPanel
               
               # penguin table mainPanel ----
               mainPanel(
                 
                 DT::dataTableOutput(outputId = "interactive_table_output") 
                 
               ) # END penguin table mainPanel
               
             ) # END penguin table sidebarLayout
             
             
           ) # END Fuild Page
           
  ) # END (Page 2) data viz tabPanel
  
) # END navbarPage