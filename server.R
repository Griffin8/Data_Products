#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
require(zoo)
library(xts)
library(forecast)

shinyServer(function(input, output) {
  #load google stock data
  googleData <- reactive({
    goog.data <- read.csv("goog.csv")
    goog.data$Date <- as.Date(as.character(goog.data$Date),format="%Y-%m-%d")
    goog.x <- xts(x=goog.data$Close, order.by = goog.data$Date)
    ts(goog.x, freq=260, start=c(2016, 6))
  })
  
  #load yahoo stock data
  yahooData <- reactive({
    yahoo.data <- read.csv("yahoo.csv")
    yahoo.data$Date <- as.Date(as.character(yahoo.data$Date),format="%Y-%m-%d")
    yahoo.x <- xts(x=yahoo.data$Close, order.by = yahoo.data$Date)
    ts(yahoo.x, freq=260, start=c(2016, 6))
  })
  
  stockData <- function(pick){
    switch(pick, 
           google = googleData(),
           yahoo = yahooData())
  }

  
  output$plot1 <- renderPlot({
    fcPeriodInput <- input$fcPeriod
    plot(forecast(ets(stockData(input$stock)), fcPeriodInput), main="Stock Price Forecast", axes = FALSE)

    # Generate labels for your x-axis
    a = seq(as.Date("2016-01-01"), by="months", length=14)
    
    # `at` is an approximation--there's probably a better way to do this, 
    # but the logic is approximately 365.25 days in a year, and an origin
    # date in R of `January 1, 1970`
    axis(1, at = as.numeric(a)/365.25+1970, labels = a, cex.axis=0.6)
    axis(2, cex.axis=0.6) 
  })
  
})
