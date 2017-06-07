download.file(url = "https://raw.githubusercontent.com/dmi3kno/SWC-tidyverse/master/data/gapminder_plus.csv", 
              destfile = "Data/gapminder_plus.csv")


library("tidyverse")

gapminder_plus <- read.csv(file = "Data/gapminder_plus.csv")


gapminder_plus %>% 
  filter(year==2007, continent=="Africa") %>% 
  mutate(babiesDead=infantMort*pop/10^3) %>% 
  filter(babiesDead>2e6) %>% 
  select(country, babiesDead) %>% 
  left_join(gapminder_plus) %>% 
  select(-countinent) %>% 
  gather(key=variable, value=, values, c(country, year))
  


gapminder_plus %>% 
  filter(year==2007, continent=="Africa") %>% 
  mutate(babiesDead=infantMort*pop/10^3) %>% 
  filter(babiesDead>2e6) %>% 
  select(country) %>% 
  left_join(gapminder_plus) %>% 
  mutate(babiesDead=infantMort*pop/10^3,
      gdp_bln=gdpPercap*pop/10^9,
      pop_mln=pop/1e6) %>% 
  select(-c(continent, pop,babiesDead)) %>% 
  gather(key=variables, value=values, -c(country, year))%>%
  ggplot(.)+
  geom_line(mapping=aes(x=year, y=values, color=country))+
    facet_wrap(~variables, scales = "free_y")+
  labs(title="mmm",subtitle="xxxx", caption="nnnn", y=NULL,x="year")
  
    



gapminder_plus %>% 
  filter(year==2007, continent=="Africa") %>% 
  mutate(babiesDead=infantMort*pop/10^3) %>% 
  filter(babiesDead>2e6) %>% 
  select(country) %>% 
  left_join(gapminder_plus) %>% 
  mutate(babiesDead=infantMort*pop/10^3,
         gdp_bln=gdpPercap*pop/10^9,
         pop_mln=pop/1e6) %>% 
  select(-c(continent, pop,babiesDead)) %>% 
  gather(key=variables, value=values, -c(country, year))%>%
  ggplot()+
  geom_text(data=. %>% group_by(varible) %>%  
              mutate(max_values) filter(values==max(values)) %>% 
              
  geom_line(mapping=aes(x=year, y=values, color=country))+
  facet_wrap(~variable, scales = "free_y")+
  labs(title="mmm",subtitle="xxxx", caption="nnnn", y=NULL,x="year")










