download.file(url = c("http://docs.google.com/spreadsheet/pub?key=phAwcNAVuyj0TAlJeCEzcGQ&output=xlsx", 
                      "http://docs.google.com/spreadsheet/pub?key=phAwcNAVuyj0NpF2PTov2Cw&output=xlsx"), 
              destfile = c("Data/indicator undata total_fertility.xlsx", 
                           "Data/indicator gapminder infant_mortality.xlsx"))


library("readxl")

raw_fert <- read_excel(path= "Data/indicator undata total_fertility.xlsx", sheet = "data")
raw_infantMort <- read_excel(path= "Data/indicator gapminder infant_mortality.xlsx")

getwd()
ls()
str(raw_fert)
ls()
str(indicator_gapminder_infant_mortality)
str(indicator_undata_total_fertility)
raw_fert <- read_excel(path="Data/indicator undata total_fertility.xlsx", sheet = "Data")
raw_fert

fert <- raw_fert %>% 
  rename(country=`Total fertility rate`) %>% 
  gather(key=year,value=fert, -country) %>% 
  mutate(year=as.integer(year))
fert
