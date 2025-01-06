shinyServer(function(input, output) {
  
  languages_filt <- reactive({
    df_long %>% 
      dplyr::filter(language %in% input$language,
                    timestamp >= as.Date(input$date_range[1]),
                    timestamp <= as.Date(input$date_range[2])
                    )
  })
  
  output$plot_popularity <- renderPlotly({
    languages_filt() %>% 
      ggplot(data = ., aes(x= timestamp, y=popularity, col=language)) +
      geom_line()
  })
  
  output$plot_average_popularity <- renderPlotly({
    languages_filt() %>% 
      group_by(language) %>% 
      summarise(ave_pop = mean(popularity)) %>% 
      ggplot(data=., aes(x=language, y=ave_pop)) +
      geom_col(fill="blue")
  })
  
  
})
