shinyUI(fluidPage(

    # Application title
    titlePanel("Life Expectancy and GDP"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("year",
                        "Year",
                        min = year_start,
                        max = year_end,
                        value = year_start,
                        step = 5),
            checkboxGroupInput(inputId = "chk_continents", label = "Continents", choices = continents, selected = continents)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plt_life_expectancy")
        )
    )
))
