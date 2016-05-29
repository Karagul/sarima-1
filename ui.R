# Shiny Application for SARMIA 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Testing Seasonality in ARIMA models"),
  h3('This app demonstrates the effect of changing the seasonality of ARIMA models on the auto.arima() function of the forecast package developed by Rob Hyndman'),
  h5(a("Link ui.R and server.R https://github.com/bobwat/sarima", href="https://github.com/bobwat/sarima")),
  
  # Sidebar with controls to select the seasonality

  sidebarLayout(
    sidebarPanel
      (
      h3 ('Instructions:'),
      h5 ('This app requires the forecast package'),
      h4 ('Select a seasonality from 1 (no seasonality) to 24, and hit the submit button'),
      
      sliderInput("n", "Seasonality:", min = 1, max = 24, value = 1, step = 1),
      submitButton("Submit"),
      h4('A new model will be calculated and the model parameters can be view in the Summary tab.  The Plot tab will show the data used for model calculation, and predict the next 36 data points along with the 95% and 80% confidence intervals. The Autocorrelation and Partial Autocorrelation for each model are presented graphically in their respective tabs'),
      h4('The best seasonal ARIMA model will exceed the blue confidence level of the ACF and PACF the fewest times, and when comparing models, the model with the lowest AIC found in the summary table should be chosen.'),
      h4('See if you can determine the seasonality of the data by determining the best model fit.')
      ),
      
     
    # Show a tabset that includes a plot, summary, acf and pacf
    # of the generated distribution
    
    mainPanel(
      
      tabsetPanel(
                  type = "tabs", 
                  
                  tabPanel("Plot", plotOutput("plot1", width = 800, height = 600)), 
                  tabPanel("Summary", verbatimTextOutput("text")),
                  tabPanel("Autocorrelation", plotOutput("plot2",width=800,height = 600)),
                  tabPanel("Partial Autocorrelation",plotOutput("plot3",width=800,height = 600))
                                    )
  )
  )
  ))