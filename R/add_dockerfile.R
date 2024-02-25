#' @title Add a Dockerfile
#' @description Adds a Dockerfile to the root directory to containerize a shiny app or report
#' @return a Dockerfile

add_dockerfile <-
  function(){

    base_template_path <- system.file("templates/Dockerfile", package = 'fsatools', mustWork = TRUE)

    # Read in the base template and create the dockerfile base using glue to pull in base image, other pkgs, pkg name and version
    base_template <- paste0(readLines(base_template_path), collapse = "\n")

    use_case_dockerfile <- paste0(readLines(base_template_path), collapse = "\n")

    dockerfile_contents <- glue::glue(paste(use_case_dockerfile, sep="\n"))

    # Write dockerfile to disk
    message(glue::glue("Writing Dockerfile"))
    write(dockerfile_contents, file = "Dockerfile", append = FALSE)
  }
