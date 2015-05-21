
# ui.R

shinyUI(fluidPage(
        titlePanel("Height Calculator"),
        sidebarLayout(
                sidebarPanel(
                        h3("Height Calculator", style="color:blue", align="left"),
                        p("Can't wait to see how tall your child will be as an adult?"),
                        p("Use our height calculator to find out."),
                        numericInput("mHeight", "Mother's Height in inches:", value=0),
                        numericInput("fHeight", "Father's Height in inches:", value=0),
                        radioButtons("Sex", label = "Sex",
                                     choices = list("Boy" = "Boy", "Girl" = "Girl")),
                        br(),
                        br(), 
                        actionButton("Calculate", "Calculate")  ,
                        br(),
                        br()
                ),
                mainPanel( 
                        p("Prediction result:", style="color:blue"),
                        textOutput("Predict"),
                        br(),
                        br(),
                        p("This height calculator uses Galton's dataset and Linear Regression model to predict how tall your child will be as an adult. This dataset used by Galton in 1885 to study the relationship between a parent's height and their childrens."), 
                        p("There are 928 observations with two variables: parent, child."),
                        p("child = The child's height in inches. "),
                        p("parent = The “midparent” height in inches."),
                        p("The midparent's height is an average of the father's height and 1.08 times the mother's height."),
                        p("The linear model give us predicted value of child's height as son's height. Daughter's height is child's height divided by 1.08"),
                        plotOutput("Height")
                )
        )
))
