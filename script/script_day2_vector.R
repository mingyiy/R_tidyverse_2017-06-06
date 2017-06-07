x <-5*6
x

is.vector(x)
length(x)

x[2] <- 31
x

x[5] <- 44
x
x[11]
x[0]

x <- 1:4
x
y <-x^2
y


z <- vector(mode = mode(x), length = length(x) )


x <- 1:5
y <- 3:7
x
y
  
  
 x+y 
  
z <- y[-5]
z
x+z
str(c("hello", "workshop","participant"))

str(c(9:11, 200, x))

str(c("somethings", pi, 2:4, pi >3))

str(c(pi, 2:4, pi >3))

c("somethings", pi, 2:4, pi >3)

str(list(c("somethings", pi, 2:4, pi > 3)))

w <- rnorm(10)
seq_along(w)
w
which(w < 0)
w[which(w < 0)]

w < 0
w[ w < 0]
w[ -c(2, 5)]

x <- list(vegetable="cabbage", 
        number = pi,
        series = 2.4,
      telling = pi > 3)

x
x$vegetable
str(x[1])

x <- list(vegetable = list("cabbage", "apple", "carrot"), 
          number =list(c(pi, 0,2,NA)),
          series = list(list(2:2, 3:5)),
          telling = pi > 3)

str(x)

mod <- lm(lifeExp ~ gdpPercap, data = gapminder_plus)
str(mod)


str(mod[[8]])
str(mod$df.residual)

mod$qr$qr[1,1]

gapminder_plus %>% 
  group_by(continent) %>% 
  summarise(mean_le=mean(lifeExp))

gapminder_plus %>% 
  group_by(continent) %>% 
  summarise(mean_le=mean(lifeExp),
            min_le = min(lifeExp),
            max_le = max(lifeExp))


gapminder_plus %>% 
  ggplot()+
  geom_line(mapping=aes(x=year, y=lifeExp, color=continent, group=country))+
  facet_wrap(~continent)


gapminder_plus %>% 
  ggplot()+
  geom_line(mapping=aes(x=year, y=lifeExp, color=continent, group=country))+
  geom_smooth(mapping=aes(x=year, y=lifeExp), method = "lm", color="black")+
  facetc_wrap(~continent)



#map(list, function)
#map(1.3, sqrt)

library(purrr)
by_country <- gapminder_plus %>% group_by(continent, country) %>% 
  nest()
by_country %>% 
  mutate(model=map(data, ~lm(lifeExp~year, data=.x)))

#by_country$data[[1]]


model_by_country <- by_country %>% 
  mutate(model=map(data, ~lm(lifeExp~year, data=.x))) %>% 
  mutate(summr=map(model, broom::glance)) %>% 
unnest(summr)

model_by_country

by_country %>% 
  mutate(model=map(data, ~lm(lifeExp~year, data=.x))) %>% 
  mutate(summr=map(model, broom::glance)) %>% 
  unnest(summr) %>% arrange(r.squared) %>% filter(r.squared<0.6) %>% 
  ggplot()+
  geom_jitter(mapping = aes(x=country, y=r.squared))


by_country %>% 
mutate(model=purrr::map(data, ~lm(lifeExp~year, data=.x))) %>% 
  mutate(summr=map(model, broom::glance)) %>% 
  unnest(summr) %>% arrange(r.squared) %>% filter(r.squared<0.5) %>% 
  select(country) %>%  left_join(gapminder_plus)%>%
  ggplot()+
  geom_line(mapping = aes(x=year, y=lifeExp, color= country, group=country))



by_country %>% 
  mutate(model=purrr::map(data, ~lm(gdpPercap~year, data=.x))) %>% 
  mutate(summr=map(model, broom::glance)) %>% 
  unnest(summr) %>% arrange(r.squared) %>% filter(r.squared<0.5) %>% 
  select(country) %>%  left_join(gapminder_plus)%>%
  ggplot()+
  geom_line(mapping = aes(x=year, y=gdpPercap, color= country, group=country))



##lifeExp~ 
by_country %>% 
  mutate(model=purrr::map(data, ~lm(lifeExp~log(gdpPercap), data=.x))) %>% 
  mutate(summr=map(model, broom::glance)) %>% 
  unnest(summr) %>% arrange(r.squared) %>% filter(r.squared<0.1) %>% 
  select(country) %>%  left_join(gapminder_plus)%>%
  ggplot()+
  geom_point(mapping = aes(x=log(gdpPercap), y=lifeExp, color= country))


save()











