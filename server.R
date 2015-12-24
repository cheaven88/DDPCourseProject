#Server
#Loading packages and attaching data
library(shiny)
library(dplyr)
library(ggplot2)


#Defining a server for the app to live in
shinyServer(
  function(input, output) {
    #Define the plot object "costHist" in ui.R
    output$costHist <- renderPlot({

      #Calculating data for text and plot
      patfilter <- patdat %>%
                  filter(PHTYPE == input$type,
                         AGTYPE == input$ag,
                         OWN == input$own,
                         CHAIN == input$chain)
      
      stats <-  patfilter %>%
                summarise(AvgCost = round(mean(TOTPAID),2),
                          PatNum = n())
                
      #create plot from availiable data, filtering by values defined in UI
      p <- ggplot(patfilter, aes(x=TOTPAID))
      p + geom_histogram(breaks=seq(0, 10000, by=500)) + annotate("text", x = 8000, y = 500, label = paste("Total Patient Count = ", stats[1,2])) + annotate("text", x = 8000, y = 475, label = paste("Average Cost Per Patient = $", stats[1,1])) + labs(list(title = "Long Term Care Costs", x = "Total Amount Paid", y = "Patient Count"))

    })
  }
)