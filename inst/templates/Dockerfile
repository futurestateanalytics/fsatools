FROM rocker/r-ver:4.2.0

COPY . /app

WORKDIR /app

RUN R -e "options(renv.config.repos.override = 'https://packagemanager.posit.co/cran/latest');           renv::restore()"

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('./app.R', host='0.0.0.0', port=3838)"]
