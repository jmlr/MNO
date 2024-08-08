#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("MNO Water Sampling Sites"),

    # Sidebar with a slider input for number of bins 
    leafletOutput("mymap")
    
)

# Define server logic required to draw interactive map
server <- function(input, output, session) {
  
  sites <- read.csv("allSites.csv")   
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
        setView(lng = -81.44, 
                lat = 48.20, 
                zoom = 5) |> 
        addTiles() |> 
        addMarkers(data = sites, lng=sites$Long, lat=sites$Lat)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
