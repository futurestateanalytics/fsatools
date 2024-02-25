#' @title Round numeric columns in a dataframe
#' @description Round numeric columns in a dataframe
#' @param data a dataframe
#' @param digits number of digits to round to
#' @return a dataframe
#' @export

round_numerics <-
  function(data, digits = 2){
    data %>%
      mutate(across(where(is.numeric), ~round(.x, digits)))
  }
