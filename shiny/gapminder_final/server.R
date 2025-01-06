shinyServer(function(input, output) {

    output$plt_life_expectancy <- renderPlot({
      current_year <- input$year
      gapminder_year <- gapminder %>% 
        dplyr::filter(year == current_year,
                      continent %in% input$chk_continents)
      
      ggplot(data=gapminder_year, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
        geom_point() +
        labs(x="GDP per Capita",
             y="Life Expectancy",
             title = "Life Expectancy and GDP",
             subtitle = current_year) + 
        geom_text(data=gapminder_year[gapminder_year$country %in% c("United States", "China"), ], 
                  aes(label=country), col = "black", size = 3) +
        coord_cartesian(xlim = c(0, 60000), ylim = c(23, 85))
    })

})
