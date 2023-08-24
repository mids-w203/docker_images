FROM rocker/rstudio:latest

LABEL maintainer = 'D. Alex Hughes <dhughes@berkeley.edu>'

## Add core computer stuff

RUN apt-get -y update && apt-get -y install \ 
  sudo            \ 
  pandoc          \
  pandoc-citeproc \
  libcurl4-gnutls-dev \
  libcairo2-dev   \
  libxt-dev       \
  libssl-dev      \
  libssh2-1-dev   \ 
  && rm -rf /var/lib/apt/lists/* 

# Add libraries for w203 class
# See: https://www.rocker-project.org/use/extending/

RUN install2.r \
  # core data manipulation
  tidyverse  \ 
  data.table \ 
  naniar     \
  janitor    \
  reshape2   \
  # core stats
  sandwich \
  lmtest   \
  lfe      \
  moments  \
  # code linting
  styler \
  lintr \
  # core reporting 
  markdown  \
  rmarkdown \
  stargazer \
  # core plotting
  patchwork \
  ggthemes  \
  GGally    \ # provides ggpairs \ 
  ggthemes  \
  plotly    \
  ggplotly  \ 
  # dashboard stuff 
  flexdashboard  \
  shinydashboard \
  # additional data data
  wooldridge \
  fec16      \
  gapminder  \
  car       \
  # misc functions
  gridExtra \
  Hmisc     \ 
  PerformanceAnalytics