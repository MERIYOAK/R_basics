covid <- read.csv("https://catalog.ourworldindata.org/garden/covid/latest/cases_deaths/cases_deaths.csv")

str(covid)
View(covid)

# we will clean the data to make a table with column with (location, date, new_cases, new_deaths, total_cases, total_deaths, population)

#covid[,c("country", "date", "new_cases", "new_deaths", "total_deaths", "total_deaths_per_million")]


library(dplyr)
library(tidyverse)

#to check for NAs
sum(any(is.na(covid)))

#find where the NA is using column-wise counts
colSums(is.na(covid))



# this looks any na value row ....covid %>% filter(if_any(everything(), is.na)



covid_clean <- covid %>%
  select(country, date, new_cases, new_deaths, total_cases, total_deaths, total_deaths_per_million) %>%
  filter(!is.na(new_deaths), !is.na(new_cases)) %>%
  mutate(date = as.Date(date)) %>%
  group_by(country, date) %>%
  summarise(
    daily_cases = sum(new_cases, na.rm = TRUE),
    daily_deaths = sum(new_deaths, na.rm = TRUE)
  )

#check the class of the date column
class(covid_clean$date)
sum(is.na(covid_clean))
colSums(is.na(covid_clean))


#second cleaning
covid_clean2 <- covid %>%
  group_by(country) %>%
  slice_max(total_cases, n = 1, with_ties = FALSE) %>%
  select(country, total_cases, total_deaths, total_deaths_per_million) %>%
  filter(country %in% c("Angola", "Eritrea", "Ethiopia", "Germany"))

#vizualization
#To compare total cases among countries. bar chart
ggplot(covid_clean2, aes(x = country, y = total_deaths_per_million, colour = country))+
  geom_col() +
  labs(title = "Total COVID-19 Deaths by Country",
       y = "Total Deaths", x = "Country")

#To see if countries with more cases also had more deaths. using scatter plot
ggplot(covid_clean2, aes(x = total_cases, y = total_deaths, label = country, colour = country)) +
         geom_point(color = "blue", size = 4) +
         geom_text(vjust = -0.5) +
         labs(title = "Relationship between Total Cases and Total Deaths",
              x = "Total Cases", y = "Total Deaths")
       
#from this above graphs we concluded that germany was the worst his from the selected four countries in teh covid_clean2 dataset


  

  

