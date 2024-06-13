
# Navigation bar ----
ui <- navbarPage(
  
  title = "Palmer Penguins Data Explorer",
  
  # Page 1 - About this app
  tabPanel(title = "About this App",
           
           # adding fluid row with about text ----
           fluidRow(
             column(1),
             column(10, includeMarkdown("text/about.md")),
             column(1)
           ), #END of fluid row with about this app
           
           fluidRow(
             column(2),
             column(8, leafletOutput(outputId = "palmer_station_map")),
             column(2)
           )
           
           ), # END of page 1 - About this app
  
  
  # Page 2 - Data exploration
  tabPanel(title = "Explore the Data",
           
           fluidPage(
             
             # Penguin plot sidebarLayout ----
             sidebarLayout(
               
               sidebarPanel(
                 
                 # island pickerInput ----
                 pickerInput(inputId = "penguin_island_input", 
                             label = "Select an island(s):",
                             choices = c("Torgersen", "Dream", "Biscoe"),
                             selected = c("Torgersen", "Dream", "Biscoe"),
                             options = pickerOptions(actionsBox = TRUE),
                             multiple = TRUE), # END island pickerInput
                 
                 # bin number sliderInput ----
                 sliderInput(inputId = "bin_num_input", 
                             label = "Select number of bins:",
                             value = 25, max = 100, min = 1), # END bin number sliderInput
                 
               ),
               
               mainPanel(
                 plotOutput(outputId = "flipperLength_histogram_output")
               )
          
               
               
             ), #END of penguin plot sidebar layout
             
             # penguin table sidebar layout
             sidebarLayout(
               sidebarPanel(
                 "tabl input goes here" #REPLACE
                 
               ),
               
               mainPanel(
                 "Table output goes here" #REPLACE
               )
             )
             
             
           ) # END of Fluid page
           
           )
  
) # END of Navbar