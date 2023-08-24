FROM rocker/rstudio

LABEL maintainer = 'D. Alex Hughes <dhughes@berkeley.edu>'

## Add core computer stuff
RUN apt-get -y update && apt-get -y install \ 
  # core libraries
  libcurl4-gnutls-dev \
  libcairo2-dev       \
  libxt-dev           \
  libssl-dev          \
  libssh2-1-dev       \ 
  # core tools
  sudo                \ 
  pandoc              \
  pandoc-citeproc     \
  # latex stuff 
  fonts-symbola       \
  libx11-xcb1         \
  libxtst6            \
  libxrandr2          \
  libasound2          \
  libpangocairo-1.0-0 \
  libatk1.0-0         \
  libatk-bridge2.0-0  \
  libgtk-3-0          \
  libnss3             \
  libxss1             \
  nodejs              \
  npm                 \
  texlive-xetex       \
  texlive-latex-extra \
  texlive-fonts-recommended \
  texlive-lang-chinese  \
  texlive-plain-generic \
  tini > /dev/null &&   \
    apt-get clean &&    \
  rm -rf /var/lib/apt/lists/* 

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
  # core database backends
  dbplyr    \ 
  DBI       \ 
  dtplyr    \ 
  nycflights13 \ 
  Lahman    \ 
  RmariaDB  \ 
  RPostgres \ 
  RSQLite   \ 
  # code linting
  styler \
  lintr \
  # core reporting 
  markdown  \
  rmarkdown \
  stargazer \
  tinytex   \ 
  # core plotting
  patchwork \
  ggthemes  \
  GGally    \ 
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