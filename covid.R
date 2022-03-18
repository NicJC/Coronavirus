library(tidyverse)
library(cowplot)
library(gridExtra)
library(ggfortify)
library(GGally)
library(rvest)
library(RCurl)
library(xml2)
library(bitops)
library(XML)
library(utils)
library(stringr)
library(knitr)
library(magrittr)
library(patchwork)
library(visdat)

url = 'https://covid19.who.int/who-data/vaccination-data.csv'

data <-read_csv(url)

data<-data.frame(data)

data<-data[complete.cases(data), ]

vis_miss(data)

names(data)

data<-data %>% select(COUNTRY,ISO3,DATE_UPDATED,TOTAL_VACCINATIONS,PERSONS_FULLY_VACCINATED,VACCINES_USED,FIRST_VACCINE_DATE,NUMBER_VACCINES_TYPES_USED)%>%
  arrange(desc(COUNTRY))
