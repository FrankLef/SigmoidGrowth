#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  fluidPage(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    titlePanel("Fake Cake Project"),
    sidebarLayout(
      sidebarPanel(
        # model selection
        selectInput("model", label = "Model", 
                    choices = c("Gompertz", "Logistic", "Monomolecular"),
                    selected = "Logistic"),
        # Total time
        numericInput("N", "Total time", value = 100),
        # Time step
        sliderInput("dt", label = "Time step", 
                    value = 10, min = 1, max = 100, step = 1),
        # nb of replicates
        sliderInput("n", label = "nb of replicates", 
                    value = 30, min = 1, max = 100, step = 1),
        sliderInput("Nrng", label = "Time range", 
                    value = c(80, 100), min = 1, max = 100, step = 1),
        # run the simulation again
        actionButton("sim", "Simulate"),
        # reset to default values
        actionButton("reset", "Reset"),
        
        width = 2
      ),
      mainPanel(
        tabsetPanel(
          id = "tabset",
          tabPanel("Dashboard",
                   fluidPage(
                     h1("Quality Control"),
                     fluidRow(
                       column(6, mod_curve_ui("curve_ui_1")),
                       column(6, mod_curve_ui("curve_ui_2"))
                       )
                     )
                   ),
          tabPanel("Simulation",
                   fluidPage(
                     h1("Sigmoid Growth"),
                     fluidRow(
                       column(6, mod_sigmoid_ui("sigmoid_ui_1")),
                       column(6, mod_sigmoid_ui("sigmoid_ui_2"))
                       )
                     )
                   )
          )
        )
      )
  )}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www'))
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'SigmoidGrowth'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

