#' sigmoid UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_sigmoid_ui <- function(id){
  
  ns <- NS(id)
  tagList(
    h2("Growth"),
    fluidRow(
      column(12,
             plotOutput(ns("growth"))
             ),
      ),
    fluidRow(
      column(6,
             numericInput(ns("initial"), "Initial Value", 
                          value = 0.01, min = 0.001, max = 1),
             numericInput(ns("capacity"), "Capacity", 
                          value = 100, min = 1, max = 1000),
             numericInput(ns("rate"), "Growth Rate", 
                          value = 0.1, min = 0.01, max = 1)),
      column(6,
             numericInput(ns("decay"), "Decay Rate", 
                          value = 10, min = 1, max = 100),
             numericInput(ns("variation"), "Variation", 
                          value = 0.2, min = 0.01, max = 1))
      )
    )
}
    
#' sigmoid Server Functions
#'
#' @noRd
mod_sigmoid_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$growth <- renderPlot({
      shinipsum::random_ggplot("line")
    })
  })
}
    
## To be copied in the UI
# mod_sigmoid_ui("sigmoid_ui_1")
    
## To be copied in the server
# mod_sigmoid_server("sigmoid_ui_1")
