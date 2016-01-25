library(shiny)
library(plotly)
library(dplyr)
dat = read.table("data/popphyl_data_pis_fis.csv",sep = ",",header = T )
dat = dat %>% filter(Number_of_Individuals >3) 


shinyServer(function(input, output) {

		    output$popphyl_data <- renderPlotly({
			    if(input$type=="Intraspecific diversity"){
				dat = dat %>% filter(status=="single")
			    	colortype = "Taxo_for_fig" 
		    }
			    else{
				colortype = "status"
			 }
tags$head( tags$script(src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML-full", type = 'text/javascript'), tags$script( "MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});", type='text/x-mathjax-config'))
			plot_ly(dat, x = piS, y = Fit, text = paste("Espece: ",Species), mode = "markers", color = eval(parse(text=colortype)),size = Number_of_Individuals, sizemode = "area", sizeref = 10) %>% layout(xaxis = list(exponentformat = "B", gridcolor = "#eee", gridwidth = 1, type ="log",title = HTML("&pi;<sub>s</sub>"))) %>%   layout(hovermode = "closest")  %>% layout(yaxis = list(title= HTML("F<sub>IT</sub>"),zeroline = FALSE))
		    })
})
