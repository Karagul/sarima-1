

library(shiny)
library(forecast)


shinyServer(function(input, output) {
  x<-as.numeric(co2[348:468])
  
 
  output$plot1 <- renderPlot({
    x<-ts(x,frequency=input$n)
    fit<-auto.arima(x)
    plot(forecast(fit,h=36))
  })
  output$text <- renderPrint({
    x<-ts(x,frequency=input$n)
    fit<-auto.arima(x)
    fit
    
  })
  output$plot2 <- renderPlot({
    x<-ts(x,frequency=input$n)
    fit<-auto.arima(x)
    acf(fit$residuals)
  
  })
  output$plot3 <- renderPlot({
    x<-ts(x,frequency=input$n)
    fit<-auto.arima(x)
    pacf(fit$residuals)
  })
  })

