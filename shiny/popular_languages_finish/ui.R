shinyUI(fluidPage(

    # Application title
    titlePanel("Most Popular Programming Languages"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "language",
                        label = "Language(s)",
                        choices = language_choices, 
                        selected = c('Python', 'R'), 
                        multiple = T,
                        ),
            dateRangeInput(inputId = "date_range", 
                           label = "Date Range", 
                           start = date_start, 
                           end = date_end)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("plot_popularity"),
            plotlyOutput("plot_average_popularity")
        )
    )
))
