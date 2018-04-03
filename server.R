# server.R
library(shiny)
source("helpers.R")
counties = readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      my_var = input$var
      #print(my_var)
      if (my_var == "Percent White") {
        values=counties$white
      } else if (my_var == "Percent Black") {
        values = counties$black
      } else if (my_var == "Percent Hispanic") {
        values = counties$hispanic
      } else {  # Percent Asian
        values = counties$asian
      }
      my_col = "Blue"
      my_title = "census Vis"
      my_min = input$range[1]
      my_max = input$range[2]
      percent_map(var=values, color=my_col, legend.title=my_title, min=my_min, max=my_max) #Arguments
    })
      
  }
)