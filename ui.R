shinyUI(pageWithSidebar(
  
  
#   tags$head(
#     tags$style(HTML("
#       .shiny-output-error-validation {
#         color: blue;
#       }
#     "))
#   ),
  
  
  
  headerPanel("Evaluation Comparison with Radar"),
  
  sidebarPanel(
    
    fileInput('file1', 'Choose CSV File',
              accept=c('text/csv', 
                       'text/comma-separated-values,text/plain', 
                       '.csv')),
    tags$hr(),
    radioButtons('sep', 'Separator',
                 c(Semicolon=';',
                   Comma=',',
                   Tab='\t'),
                 ','),
    
    uiOutput("choose_person"),
    
    uiOutput("choose_columns"),
    br(),
    a(href = "http://statisticstoproveanything.blogspot.de/2013/11/spider-web-plots-in-r.html",
      "Radar by Alan Vaughn from statisticstoproveanything")
    
  ),
  
  
  mainPanel(
    tableOutput('contents'),
    plotOutput(outputId = "radar", height = "600px")   
  )
))