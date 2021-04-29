#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ECharts2Shiny)

myData <- read.csv('ready.csv')
listOptions = list()

for (i in myData$Requisition.ID){
  newelem <- paste(i,"=",i)
  listOptions <- c(listOptions, newelem)
}

listOptions <- c(listOptions, "Total = Total")
# Define server logic for random distribution application
shinyServer(function(input, output) {
  
  # Reactive expression to generate the requested distribution. This is 
  # called whenever the inputs change. The renderers defined 
  # below then all use the value computed from this expression
  data <- reactive({  
    metric <- switch(input$req,
                     listOptions)
    
  })
  
  # formulaText <- reactive({ myData$Candidates.per.req[which(myData$Requisition.ID==input$req)]})
  # Generate a plot of the data. Also uses the inputs to build the 
  # plot label. Note that the dependencies on both the inputs and
  # the 'data' reactive expression are both tracked, and all expressions 
  # are called in the sequence implied by the dependency graph
  # total <- mean(myData$Candidates.per.req)
  output$reqTitle <- renderText(if(input$req=='Total'){'All Hires'}
                                else {as.character(myData$Requisition.Display.Job.Title[which(myData$Requisition.ID==input$req)])})
  output$cph <- renderText(if(input$req=='Total'){round(mean(myData$Candidates.per.req))}
                           else {myData$Candidates.per.req[which(myData$Requisition.ID==input$req)]})
  output$tth <- renderText(if(input$req=='Total'){round(mean(myData$Requisition.Time.to.Fill))}
                           else {myData$Requisition.Time.to.Fill[which(myData$Requisition.ID==input$req)]})
  output$reqdiv <- renderPlot({
    barplot(table(myData$Requisition.Division), main="Hires per Division",
            xlab="Division")
  })

})
  
