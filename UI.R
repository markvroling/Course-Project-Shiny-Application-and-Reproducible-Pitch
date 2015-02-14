library(shiny)
shinyUI(pageWithSidebar(
    headerPanel('Calculation of your BMI (Body Mass Index)'),
    sidebarPanel(
        numericInput("weight", "weight in kilograms:",0),
        numericInput("length", "Length in centimeters:",0),
        radioButtons("gender","Gender:", c("Male","Female")),
        dateInput("dateOfBirth", "Date of birth:", value= "1990-02-13" ,startview = "decade"),
        submitButton("Submit")
    ),
    mainPanel(
        tabsetPanel(type = "tabs",
            tabPanel("Documentation",style= "color:blue",
                     h4(strong("Welcome to my BMI calculator!")),
                     p(h5("To calculate your BMI, please fill in the form on the left. You must enter your weight in kilograms (1 kg = 2.20462262185 lbs)
                          and length in centimeters (1 cm = 0.393700787 inches). Please also fill in your gender and date of birth. ")),
                     p(h5("After filling in the form you have to push the submit button to calculate your BMI. You can find your BMI and the BMI formula used
                          in the tab 'BMI'.")),
                     p(h5("You can find a Histogram in the tab 'Plot' with BMI data of other people. When you have filled in the form, you will see a red line of your BMI.
                          You are now able to compare your BMI with others. ")   
                         ),
                     p(h5("You can find the data used for the histogram in the last tab.")   
                         ),
                     p(h5("Enjoy the App!")   
                         ),
                     a("linkt to Github repository",href="https://github.com/markvroling/Course-Project-Shiny-Application-and-Reproducible-Pitch.git")
                         ),
            tabPanel("BMI", 
                     h3('Your scorecard'),
                     h4('Weight entered (KG)'),
                     verbatimTextOutput("weightOutput"),
                     h4('Length entered (CM)'),
                     verbatimTextOutput("lengthOutput"),
                     h4('Formula used'),
                     code('calculateBMI <- function(weight, length){
                         weight / ((length/100)^2)
                     }'),
                     h4('Your BMI'),
                     verbatimTextOutput("BMI")), 
            tabPanel("Plot", plotOutput("hist")),
            tabPanel("Data", tableOutput("table")))
        )           
    ))