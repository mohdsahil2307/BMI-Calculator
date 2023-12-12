# Base image https://hub.docker.com/u/rocker/
FROM rocker/shiny:4.3.2@sha256:cd71333a7d1887b78db22790bfd782ea7142554d3ac93c7120b6bb0cd13ee675

# system libraries of general use
## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libsqlite3-dev \
    libmariadbd-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libcurl4-openssl-dev \
    libssl-dev

## update system libraries
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

# copy necessary files
## renv.lock file
COPY renv.lock .
## app folder
COPY app.R .

# install renv & restore packages
RUN Rscript -e 'install.packages("renv")'
RUN Rscript -e 'renv::restore()'

# expose port
EXPOSE 3838

# run app on container start
CMD ["R", "-e", "shiny::runApp('/', host = '0.0.0.0', port = 3838)"]