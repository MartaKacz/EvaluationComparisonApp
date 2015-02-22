
shinyServer(function(input, output) {
  
  # uploading the csv file
  myData <- reactive({
    
    # instead of error before we load the file
    validate(
      need(input$file1 != "", "Please select a csv file")
    )
    
    inFile <- input$file1
    if (is.null(inFile)) return(NULL)
    data <- read.csv(inFile$datapath, header= TRUE, sep=input$sep, dec= ",")
    data
  })
  output$contents <- renderTable({
  myData()
  })
  
  # select the evaluator
  output$choose_person <- renderUI({
    
    ocena = myData()
    selectInput("person","Evaluator",as.character(ocena[,1]))
  })
  
  
  # check boxes
  output$choose_columns <- renderUI({
    ocena = myData()
    # if missing input, return to avoid error later in function
    if(is.null(ocena))
      return()
    
    # get the data set with the appropriate name
    dat <- ocena[,-1]
    colnames <- names(dat)
    
    # create the checkboxes and select them all by default
    checkboxGroupInput("columns", "Choose competence", 
                       choices  = colnames,
                       selected = colnames)
  })
  
  
  # plot the radar chart using webplot() function written by Alan Vaughn
  output$radar <- renderPlot({
    ocena = myData()
    source("radar.R")
    webplot(ocena,
            which(as.character(ocena[,1]) == input$person), y.cols = input$columns,add=F
            ,col = "blue"
            , main = input$person)
  })
  
 
})

###
##setwd("C:/Users/mkaczmarz/Desktop")
##runApp("MyAppp")
