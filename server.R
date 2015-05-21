#server.R
library(UsingR)
data(galton)
mdLm <- lm(child ~ parent, data=galton)

shinyServer(function(input, output) {
        
        output$Predict <- renderText({
                input$Calculate     
                isolate({
                        mP <- (input$fHeight + 1.08*input$mHeight)/2
                        if (input$fHeight == 0 | input$mHeight == 0 | is.na(input$fHeight) | is.na(input$mHeight )) 
                        {"Please enter parent's height"}
                        else if   (input$Sex== "Boy"){
                                paste("Your ", input$Sex, "'s height is : ",{
                                        round(predict(mdLm,
                                                      data.frame(parent = mP)),0)  
                                }, " inches.")
                        }
                        else if (input$Sex== "Girl"){
                                paste("Your ", input$Sex, "'s height is : ",{
                                        round(predict(mdLm,
                                                      data.frame(parent = mP))/1.08,0)
                                }, " inches.")
                        }
                        else {"Oops, Please enter parent's height in inches"}          
                })
        })
        output$Height <- renderPlot({
                sunflowerplot(galton$parent, galton$child, xlim=c(62,74), 
                              ylim=c(62,74), xlab="Parent' Height in inches", 
                              ylab="Child's Height in inches",
                              main="Sunflower Plot of Galton Dataset with Linear Regression Line")
                abline(mdLm)
                input$Calculate
                isolate({
                        mP1 <- (input$fHeight + 1.08*input$mHeight)/2
                        Pred <- round(predict(mdLm,
                                              data.frame(parent = mP1)),0) 
                        points(x=mP1,y=Pred, col="blue", pch=19)
                })
        })
})


