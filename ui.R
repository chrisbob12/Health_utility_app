library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("EQ-5D-5L health status"),
  sidebarPanel(
    selectInput("id1","Mobility", c("choose one"="9",
                                    "I have no problem in walking about"="1",
                                    "I have slight problems in walking about"="2",
                                    "I have moderate problems in walking about"="3",
                                    "I have severe problems in walking about"="4",
                                    "I am unable to walk about"="5")),              
    
    selectInput("id2","Self-Care", c("choose one"="9",
                                     "I have no problems washing or dressing myself"="1",
                                     "I have slight problems washing or dressing myself"="2",
                                     "I have moderate problems washing or dressing myself"="3",
                                     "I have severe problems washing or dressing myself"="4",
                                     "I am unable to wash or dress myself"="5")),
    
    selectInput("id3","Usual Activities", c("choose one"="9",
                                            "I have no problems doing my usual activities"="1",
                                            "I have slight problems doing my usual activities"="2",
                                            "I have moderate problems doing my usual activities"="3",
                                            "I have severe problems doing my usual activities"="4",
                                            "I am unable to do my usual activities"="5")),
    
    selectInput("id4","Pain/Discomfort", c("choose one"="9",
                                           "I have no pain or discomfort"="1",
                                           "I have slight pain or discomfort"="2",
                                           "I have moderate pain or discomfort"="3",
                                           "I have severe pain or discomfort"="4",
                                           "I have extreme pain or discomfort"="5")),
    
    selectInput("id5","Anxiety/Depression", c("choose one"="9",
                                              "I am not anxious or depressed"="1",
                                              "I am slightly anxious or depressed"="2",
                                              "I am moderately anxious or depressed"="3",
                                              "I am severely anxious or depressed"="4",
                                              "I am extremely anxious or depressed"="5")),
    
    
    
    
    sliderInput("id6","how good is your health?",min=0,max=100,value=50,step=1),
    
    
    selectInput("id7","Country", c("Denmark"="Denmark","France"="France",
                                   "Germany"="Germany","Japan"="Japan",
                                   "Netherlands"="Netherlands","Spain"="Spain",
                                   "Thailand"="Thailand","UK"="UK","US"="US",
                                   "Zimbabwe"="Zimbabwe"),selected="US"),
    submitButton("submit your responses")
    
  ),
  ## ************************************************************************************
  mainPanel(
    
    tabsetPanel(
      tabPanel("EQ5 tool",h3('Results'),h3('User Input'),
               h4('Your EQ-5D code'),
               textOutput("indices"),
               h4('Your self-assessed health score'),
               textOutput("self"),
               h3('App output'),
               h4('utility index'),
               textOutput("EQ5index"),
               h4('self-assessment versus index'),
               textOutput("delta")),
      
      tabPanel("Documentation", h3('Using the app'),
               p('You need to enter something in each of the drop-down pick lists
from mobility to Anxiety/Depression, and move the slider to give a self-assessment 
of your state of health.'),
p('The scores are weighted differently for different countries; the default is for United States.'),
p('Nothing will be calculated until the submit responses button is clicked.'),
p('When you submit your response the results are shown giving the health code 
and self-assessment scores you submitted, followed by a health utility index derived 
from a table of standard scores and values by country. A calculation is also shown 
for the difference between your self-assessment and a scaled value of the utility index.'),
p('The App output shows zero if any of the drop-down lists is left on \'choose one\'.'))
      
      
      
    )
  )
))