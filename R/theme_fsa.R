#' @title apply custom ggplot theme
#' @description fsa ggplot theme
#' @return ggplot theme
#' @export

theme_fsa <-
  function(base_size = 11,
           strip_text_size = 12,
           strip_text_margin = 10,
           subtitle_size = 13,
           subtitle_margin = 10,
           plot_title_size = 16,
           plot_title_margin = 10,
           font = "IBM Plex Mono",
           ...) {

    ret <-
      theme_gray(base_family = font,
                 base_size = base_size, ...,) +
      theme(
        panel.background = element_rect(fill = "#e9e9ea"),
        plot.background = element_rect(fill = "#f3f3f3"),
        legend.background = element_rect(fill = "#f3f3f3"),
        panel.grid = element_line(color = "#ffffff"),
        panel.grid.major = element_line(color = "#ffffff")
      )

    ret$strip.text <-
      ggplot2::element_text(
        # hjust = 0,
        vjust = -.8,
        size = strip_text_size,
        margin = ggplot2::margin(b = strip_text_margin),
        family = font
      )

    ret$plot.subtitle <-
      ggplot2::element_text(
        hjust = 0,
        size = subtitle_size,
        margin = ggplot2::margin(b = subtitle_margin),
        family = font
      )

    ret$plot.title <-
      ggplot2::element_text(
        hjust = 0,
        size = plot_title_size,
        margin = ggplot2::margin(b = plot_title_margin),
        family = font
      )
    ret
  }

fsa_colors <-
  function(...) {

    fsa_colors <- c(
      `blue1`   = "#44A6FF",
      `red1`    = "#FF736B",
      `green1`  = "#59918B",
      `green2`  = "#00625C",
      `yellow1` = "#DDA01E",
      `green3`  = "#00ECBD")

    cols <- c(...)

    if (is.null(cols))
      return (fsa_colors)

    fsa_colors[cols]
  }

fsa_palette <-
  function(palette = "main", ...) {

    fsa_palette <- list(
      `main` = fsa_colors("blue1", "red1", "green1", "green2"),

      `highlight` = fsa_colors("yellow1", "green3")
    )

    fsa_palette[[palette]]

  }

show_palette <-
  function(palette = "main"){
    scales::show_col(fsa_palette(palette), cex_label = 2)
  }

palette_gen <-
  function(palette = "main", direction = 1) {

    function(n) {

      if (n > length(fsa_palette(palette)))
        warning("Not enough colors in this palette!")

      else {

        all_colors <- fsa_palette(palette)

        all_colors <- unname(unlist(all_colors))

        all_colors <- if (direction >= 0) all_colors else rev(all_colors)

        color_list <- all_colors[1:n]

      }
    }
  }

palette_gen_c <-
  function(palette = "main", direction = 1, ...) {

  pal <- fsa_palette(palette)

  pal <- if (direction >= 0) pal else rev(pal)

  colorRampPalette(pal, ...)

  }

scale_fill_fsa <-
  function(palette = "main", direction = 1, ...) {

  ggplot2::discrete_scale(
    "fill", "fsa",
    palette_gen(palette, direction),
    ...
  )
}

scale_color_fsa <-
  function(palette = "main", direction = 1, ...) {

  ggplot2::discrete_scale(
    "colour", "fsa",
    palette_gen(palette, direction),
    ...
  )
}

scale_color_fsa_c <-
  function(palette = "main", direction = 1, ...) {

    pal <- palette_gen_c(palette = palette, direction = direction)

    scale_color_gradientn(colors = pal(256), ...)

  }
