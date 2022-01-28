#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  
  credentials <- data.frame(
    user = c("shiny", "shinymanager"), # mandatory
    password = c("azerty", "12345"), # mandatory
    start = c("2019-04-15"), # optinal (all others)
    expire = c(NA, "2019-12-31"),
    admin = c(TRUE, TRUE),
    comment = "Simple and secure authentification mechanism 
  for single ‘Shiny’ applications.",
    stringsAsFactors = FALSE
  )
  
  res_auth <- shinymanager::secure_server(
    check_credentials = shinymanager::check_credentials(credentials)
  )
  
  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })
  
  # Your application server logic 
  
}
