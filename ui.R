#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
# based on the tabset example at https://rstudio.github.io/shiny/tutorial/#tabsets

library(shiny)
library(ECharts2Shiny)

myData <- read.csv('ready.csv')

listOptions = list()
for (i in myData$Requisition.ID){
  listOptions <- c(listOptions, i)
}
listOptions <- c(listOptions, "Total")

# Define UI for random distribution application 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Filled Requisitions"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the br()
  # element to introduce extra vertical spacing
  sidebarPanel(
    selectInput("req", "Req: ",
                 listOptions)
    
  ),
  
  # Show a tabset that includes a plot, summary, and table view
  # of the generated distribution
  mainPanel(
    h3(textOutput("reqTitle")),
    h3("Candidates per hire: ", textOutput("cph")),
    h3("Time to hire: ", textOutput("tth")),
    plotOutput("reqdiv"))
  )
)