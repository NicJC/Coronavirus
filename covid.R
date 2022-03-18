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


data <- read_csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")

data<-data.frame(data)

data2<-data[complete.cases(data), ]

names(data)

df<-data %>% select(location,iso_code,continent,date,total_cases,total_deaths,total_tests,positive_rate,total_vaccinations,people_vaccinated,people_fully_vaccinated,stringency_index,population) %>%
  arrange(desc(stringency_index))


write.csv(df,"covid.csv",row.names=FALSE)

skimr::skim(df)


GGally(df)

ggsave("covariance_matrix.png", width = 7, height = 7)