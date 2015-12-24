#UI
library(shiny)
attach(patdat)

shinyUI(
  #Type of layout
  fluidPage(
    
    #Page Title
    titlePanel("Exploring Long Term Care Costs"),
    
    #Generate sidebar with content
    sidebarLayout(
      
      #Define sidebar input
      sidebarPanel(
        #PHTYPE Input
        selectInput("type","Patient Type:",
                    choices = unique(patdat$PHTYPE)),
        hr(),
        #AGTYPE input
        selectInput("ag","Agency Type:",
                    choices = unique(patdat$AGTYPE)),
        hr(),
        #OWN input
        selectInput("own","Profit Status:",
                    choices = unique(patdat$OWN)),
        hr(),
        #CHAIN input
        selectInput("chain","Chain Status:",
                    choices = unique(patdat$CHAIN)),
        hr(),
        #Explanatory text
        helpText("Data from the 2007 National Home Health and Hospice Care Survey ")
      ),
      
      #Create main panel
      mainPanel(
        
        #Heading 1 in main panel
        h1("Histogram of Costs",align="center"),
        
        #Graph output defined in server.R
        plotOutput('costHist')
      )
    )
    
  ))
