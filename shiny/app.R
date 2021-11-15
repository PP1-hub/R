#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI
ui <- fluidPage(theme = shinytheme("journal"),
      navbarPage(
        "My first App",
        tabPanel("Page 1",
                 sidebarPanel(
                   tags$h3("Input:"),
                   textInput("txt1", "Enter Name:", ""),
                   textInput("txt2", "Surname:", ""),
                 ),
                 mainPanel(
                           h1("Header 1"),
                           
                           h4("Output"),
                           verbatimTextOutput("txtout"),
                 )#mainPanel
                 
                 ), #Page1, tabPanel
                
                tabPanel("Page 2", "This panel is intentionally left blanck"),       
                tabPanel("Page 3", "This panel is intentionally left blanck"),
        
                   
                 ) #navbarPage
                ) #fluidPage

    
#Define server function
server <- function(input, output){
  output$txtout <- renderText({
    paste( input$txt1, input$txt2, sep = " ")
  })
} #server
   

# Run the application 
shinyApp(ui = ui, server = server)
