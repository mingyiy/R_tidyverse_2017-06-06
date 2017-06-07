library(tidyverse)
gapminder <- read.csv("/Users/yangmingyi/R_course2017/2017-06-06_R_tidyverse/data/gapminder-FiveYearData.csv")
ls()
str(gapminder)

ggplot(data = gapminder) + 
  geom_point(mapping = aes(x = gdpPercap, y = lifeExp)) 

ggplot(data = gapminder) +
  geom_jitter(mapping = aes(x = year, y = lifeExp, color=continent)) 

ggplot(data = gapminder) + 
  geom_point(mapping = aes(x = log(gdpPercap), y = lifeExp, color=continent, size=pop))


ggplot(data = gapminder) + 
  geom_point(mapping = aes(x = gdpPercap, y = lifeExp), alpha=0.1, size=2, color="blue")

ggplot(data = gapminder) + 
  geom_line(mapping = aes(x = year, y = lifeExp, group=country, color=continent)) 


ggplot(data = gapminder, mapping = aes(x = continent, y = lifeExp, color=continent)) + 
  geom_jitter() + 
  geom_boxplot()

ggplot(data = gapminder, mapping = aes(x = log(gdpPercap), y = lifeExp, color=continent)) + 
  geom_point(alpha=0.5) + 
  geom_smooth(method="lm")

ggplot(data = gapminder, mapping = aes(x = log(gdpPercap), y = lifeExp)) + 
  geom_point(mapping=aes(color=continent), alpha=0.5) + 
  geom_smooth(method="lm")

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point() +
  geom_smooth() +
  scale_x_log10()


Challange 6

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  geom_smooth() +
  scale_x_log10() + 
  facet_wrap( ~ continent)

filter(gapminder, year==2007)

ggplot(filter(gapminder, year==2007)) + 
  geom_bar(mapping = aes(x=continent))

ggplot(filter(gapminder, year==2007)) + 
  geom_bar(mapping = aes(x=continent), stat="count")

ggplot(filter(gapminder, year==2007 & continent=="Oceania")) + 
  geom_bar(mapping = aes(x=country, y=pop), stat="identity")

ggplot(filter(gapminder, year==2007 & continent=="Asia")) + 
  geom_bar(mapping = aes(x=country, y=pop), stat="identity") +
  coord_flip()

ggplot(data = gapminder) + 
  geom_point(mapping = aes(x = gdpPercap, y = lifeExp, color=continent)) +
  scale_x_log10() +
  facet_wrap(~year)

ggplot(data = gapminder) + 
  geom_point(mapping = aes(x = gdpPercap/10^3, y = lifeExp, size=pop/10^6, color=continent)) +
  scale_x_log10() +
  facet_wrap(~year) + 
  labs(title="Life Expectancy vs GDP per capita over time",
       subtitle="In the past 50 years, life expectancy has improved in most countries of the world",
       caption="Source: Gapminder foundation, https://www.gapminder.org/data/",
       x="GDP per capita, '000 USD",
       y="Life expectancy, years",
       color="Continent",
       size="Population, mln")

library("readxl")
raw_fert <- read_excel(path= "/Users/yangmingyi/R_course2017/2017-06-06_R_tidyverse/data/indicator undata total_fertility.xlsx", sheet = "Data")
raw_infantMort <- read_excel(path= "/Users/yangmingyi/R_course2017/2017-06-06_R_tidyverse/data/indicator gapminder infant_mortality.xlsx", sheet = "Data")
ls()

fert <- raw_fert %>% 
  rename(country=`Total fertility rate`) %>% 
  gather(key=year,value=fert, -country) %>% 
  mutate(year=as.integer(year))

fert

