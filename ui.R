#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Stock price forecast"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Select a stock:"),
      radioButtons("stock", "",
                   list("google", "yahoo")),
      h3("Select forecast days:"),
      sliderInput("fcPeriod", "",7, 100, 0)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1")
    )
  )
))
