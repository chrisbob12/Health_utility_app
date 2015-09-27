library(shiny)
## read in cleaned data table
data <- readRDS("EQ5data.rds")

## set up reactive function to inputs
shinyServer(function(input,output){
  EQ5index <- reactive({
    healthstatus <- paste(input$id1,input$id2,input$id3,
                          input$id4,input$id5,sep="")
    locality <- input$id7
    instance <- grep(healthstatus,data[,1])
    data[instance,locality]
  })

## create code number from inputs  
  indices <- renderPrint({
    paste(input$id1,input$id2,input$id3,input$id4,input$id5,sep="")
  })
  
  output$indices <- indices
  
  if(identical(indices, "99999")){
    output$EQ5index <- 1000
  }else{
    output$EQ5index <- renderPrint({EQ5index()})
  }
  
  output$self <- renderPrint({(input$id6)})
  output$delta <- renderPrint({input$id6-((EQ5index()+0.654)*100/1.654)})
  
}
)