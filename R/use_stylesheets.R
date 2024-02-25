#' @title Custom HTML template
#' @description adds additional style
#' @export

use_stylesheets <-
  function() {

    shiny::addResourcePath(
      "styles",
      system.file("stylesheets", package = "fsatools")
    )

    shiny::tags$head(
      tags$style(
        HTML('
         @import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Mono");
         @import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans");')
      ),
      shiny::tags$link(rel = "stylesheet", href = "styles/styles.min.css")
    )
  }
