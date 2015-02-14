library(shiny)

calculateBMI <- function(weight, length){
    weight / ((length/100)^2)
}


shinyServer(
    function(input,output){
        dataBMI <- read.csv("BMI.csv", sep=";")
        output$hist <- renderPlot({
            hist(dataBMI$BMI,breaks = 10, xlab = "BMI", main = "")
            value <- calculateBMI(input$weight, input$length)
            abline(v= value, col = "red", lwd = 5)
            title("your BMI in comparison with others")
        })
        output$weightOutput = renderPrint({input$weight})
        output$lengthOutput = renderPrint({input$length})
        output$BMI = renderPrint({calculateBMI(input$weight, input$length)})
        output$table = renderTable({
            data.frame(dataBMI)
        })

    }
)