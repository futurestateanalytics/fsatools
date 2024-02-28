#' @title create a reactable object
#' @description a reactable object
#' @param data a dataframe
#' @param size number of rows to display
#' @param wrap wrap columns?
#' @param fullWidth should table be full width?
#' @return a reactable
#' @export

get_table <-
  function(data, size = 10, wrap = FALSE, fullWidth = FALSE, ...){
    data %>%
      round_numerics() %>%
      reactable::reactable(.,
                           fullWidth = fullWidth,
                           resizable = TRUE,
                           filterable = TRUE,
                           highlight = TRUE,
                           defaultPageSize = size,
                           wrap = wrap,
                           showSortIcon = TRUE,
                           striped = TRUE,
                           compact = TRUE)
  }
