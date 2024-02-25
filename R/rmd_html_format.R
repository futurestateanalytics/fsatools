#' @title Custom HTML template
#' @description additional style and template file
#' @param toc should a table of contents be displayed?
#' @param ... additional arguments provided to \@code{html_document}
#' @export

rmd_html_format <-
  function(toc = TRUE, ...) {

  # locations of resource files in the package
  pkg_resource <-
    function(...) {
    system.file(..., package = "fsatools")
  }

  css <- pkg_resource("rmarkdown/resources/style.css")
  footer <- pkg_resource("rmarkdown/resources/footer.html")
  header <- pkg_resource("rmarkdown/resources/header.html")

  # call the base html_document function
  rmarkdown::html_document(
    toc = toc,
    toc_float = TRUE,
    css = css,
    number_sections = FALSE,
    includes = rmarkdown::includes(after_body = footer, in_header = header)
  )
}
