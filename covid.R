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


df<-data %>% select(location,iso_code,continent,date,total_cases,total_deaths,total_tests,positive_rate,total_vaccinations,people_vaccinated,people_fully_vaccinated,stringency_index,population) %>%
  arrange(desc(stringency_index))%>%
  mutate(month = format(date, "%m"), year = format(date, "%Y")) %>%
  group_by(month, year)

write.csv(df,"covid.csv",row.names=FALSE)

skimr::skim(df)


ggplot(df, aes(date,people_fully_vaccinated,color = year)) + geom_jitter() + facet_wrap(~  year)  + theme_bw() + labs(title = "Vaccination rate (Globally)",subtitle = "Coronavirus vaccinations by year", y = "People fully vaccinated")

ggsave("Vaccination_facet.png", width = 10, height = 7)