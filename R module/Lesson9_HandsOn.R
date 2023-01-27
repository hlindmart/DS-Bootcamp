library(ggplot2)
library(dplyr)
library(gapminder)

levels(gapminder$country)

View(gapminder)

unique(gapminder$year)

#filtering my chosen countries
gapminder%>%filter(country%in% c("Puerto Rico", "Jordan", "Lebanon", "Sweden", "Colombia")) -> myCountries

View(myCountries)

#filtering by desired years
filter(myCountries, year%in% c(1952, 2007))%>%
  arrange(year)%>%
  select(country, year, gdpPercap)

#lineplot for lifeExp
ggplot(myCountries, aes(x=year, y=lifeExp, color=country))+
  geom_line()

#median for entire data set
gapminder%>%select(year, lifeExp)%>%
  group_by(year)%>%
  summarise(median(lifeExp))

#median for my countries by year
myCountries%>%select(year, lifeExp)%>%
  group_by(year)%>%
  summarise(median(lifeExp))

#median for my countries by country
myCountries%>%select(country, lifeExp)%>%
  group_by(country)%>%
  summarise(median(lifeExp))