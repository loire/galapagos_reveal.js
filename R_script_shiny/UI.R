library(shiny)
library(plotly)

shinyUI(fluidPage(titlePanel("Données popphyl: Diversité vs Structure"),    tags$head( tags$script(src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML-full", type = 'text/javascript'), tags$script( "MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});", type='text/x-mathjax-config')),selectInput(inputId = "type",label = strong(""),choices = c("Intraspecific diversity","Interspecific diversity (same genus)") , selected = "Intraspecific diversity" ),mainPanel(width = "100%",plotlyOutput("popphyl_data"))))
