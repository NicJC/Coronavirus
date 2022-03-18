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

#url = 'https://covid19.who.int/who-data/vaccination-data.csv'

#data <-read_csv(url)

#data<-data.frame(data)

#data<-data[complete.cases(data), ]

#vis_miss(data)

#names(data)

#data<-data %>% select(COUNTRY,ISO3,DATE_UPDATED,TOTAL_VACCINATIONS,PERSONS_FULLY_VACCINATED,VACCINES_USED,FIRST_VACCINE_DATE,NUMBER_VACCINES_TYPES_USED)%>%
  arrange(desc(COUNTRY))


#write.csv(data,"covid.csv",row.names=FALSE)

data2 <- read_csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")

data2<-data.frame(data2)

data2<-data[complete.cases(data2), ]


names(data2)

write.csv(data,"covid.csv",row.names=FALSE)