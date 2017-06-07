gapminder <- read.csv("../2017-06-06<_R_tidyverse/data/gapminder-FiveYearData.csv")   
head(gapminder)
library(tidyverse)
gapminder <- read.csv("../2017-06-06_R_tidyverse/data/gapminder-FiveYearData.csv") 
gapminder
browseVignettes(package = "dplyr")
rep("this is an example", times=3) 
"this is an example" %>% rep(times=3)


year_country_gdp <- select(gapminder,year,country,gdpPercap)
year_country_gdp

year_country_gdp <- gapminder %>% 
  select(year,country,gdpPercap)
head(year_country_gdp)

gapminder %>% 
  filter(year==2002) %>% 
  ggplot(mapping = aes(x=continent, y=pop))+
  geom_boxplot()


gapminder %>% 
  filter(year==2002) %>% 
  ggplot(mapping = aes(x=continent, y=pop))+
  geom_boxplot()


year_country_gdp_euro <- gapminder %>% 
  filter(continent=="Europe") %>% 
  select(year,country,gdpPercap)

year_country_gdp_euro


year_country_gdp_Norwegian <- gapminder %>% 
  filter(country=="Norway") %>% 
  select(year,country,gdpPercap)


year_country_gdp_Norwegian


gapminder %>% 
  group_by(continent)

gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_gdpPercap=mean(gdpPercap))

gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_gdpPercap=mean(gdpPercap)) %>% 
  ggplot(mapping = aes(x=continent, y=mean_gdpPercap))+
  geom_point()




  gapminder %>% 
    filter(continent=="Asia") %>%
    group_by(country) %>% 
    summarise(mean_lifeExp=mean(lifeExp)) %>% 
    ggplot(mapping = aes(x=country, y=mean_lifeExp))+
    geom_point()+
    coord_flip()

  gapminder %>% 
    mutate(dp_billion=gdpPercap*pop/10^9) %>% 
    head()

  
  gapminder_country_summary <- gapminder %>% 
    group_by(country) %>% 
    summarise(mean_lifeExp= mean(lifeExp))
    
library(maps)
  
map_data("world") %>% 
  rename(country=region) %>%
  left_join(gapminder_country_summary, by="country") %>% 
  ggplot()+
  geom_polygon(aes(x=long,y=lat,group=group,fill=mean_lifeExp))+
  scale_fill_gradient(low = "blue",high = "red")+
  coord_equal()

gapminder




  
  
  
  
