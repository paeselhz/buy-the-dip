FROM rocker/shiny:4.0.3

RUN install2.r \
    --error \
    dplyr \
    DT \
    shiny \
    plotly \
    formattable \
    shinyWidgets \
    readr

COPY . /srv/shiny-server/buy-the-dip/
COPY templates/shiny-server.conf /etc/shiny-server/shiny-server.conf

RUN chmod -R 777 /srv/shiny-server/