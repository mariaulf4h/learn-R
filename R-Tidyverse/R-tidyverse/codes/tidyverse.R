
#install.packages("gapminder")
library(gapminder)


getwd()
setwd("C:/Users/Maria Ulfah/Downloads/R_presentasi/R-tidyverse")
dir()

#delete values/variable from the environment
#ls(rm("spain"))
#delete all environment
#rm(list = ls(all.names = TRUE))

gapminder

library(tidyverse)
library(dplyr)

#filtering data gapminder in 2007
year_2007 <- gapminder %>%
                filter(year == 2007)
year_2007

#filtering data gapminder "United States"

united_states <- gapminder %>%
                  filter(country == "United States")
united_states

#filtering data gapminder "United States" in 2007

united_states_2007 <- gapminder %>%
  filter(country == "United States", year == 2007)

united_states_2007

#sorting/arrangin data based on gdp per capita (ascending order = default)

sort_gdp <- gapminder %>%
              arrange(gdpPercap)
sort_gdp

# sorting data based on gdp per capita (descending order)

sort_gdp_desc <- gapminder %>%
                  arrange(desc(gdpPercap))
sort_gdp_desc

# filter and sorting

sort_filter <- gapminder %>%
              filter(year == 2007) %>%
              arrange(desc(gdpPercap))

sort_filter

#mutate : changing values in pop variable (with a million)
pop_mutate<- gapminder %>%
                      mutate(pop = pop/1000000)
pop_mutate

#mutate: creating new variable "gdp" from gdpPercap * pop

gapminder_with_gdp <- gapminder %>%
                        mutate(gdp = gdpPercap * pop)
gapminder_with_gdp

#combine mutate with filter and arrange

gapminder_gdp_2007 <- gapminder %>%
                  mutate(gdp = gdpPercap * pop) %>%
                  filter(year == 2007) %>%
                  arrange(desc(gdp))
gapminder_gdp_2007

#summarizing data
#summarizing avarage of life expectancy

avg_life <- gapminder %>%
     summarize(meanlifeExp = mean(lifeExp))

avg_life

#summarizing avarage of life expectancy by year 2007
avg_life_2007 <- gapminder %>%
                 filter(year == 2007) %>%
                 summarize(meanlifeExp = mean(lifeExp))

avg_life_2007

#summarizing avarage of life expectancy & max GDP per cap by year 2007

avg_max <- gapminder %>%
  filter(year == 2007) %>%
  summarize(meanlifeExp = mean(lifeExp),
            maxgdpPercap = max(gdpPercap))

avg_max

#group_by() summary: mean life_exp by year
lifex_year <- gapminder %>%
                group_by(year) %>%
                summarize(meanLifeExp = mean(lifeExp),
                          totalPop = sum(pop))
lifex_year

gapminder

#group_by() summary: mean life_exp by continent in 2007
lifeex_cont_2007 <- gapminder %>%
                      filter(year == 2007) %>%
                      group_by(continent) %>%
                      summarize(meanLifeExp = mean(lifeExp),
                              totalPop = sum(pop))
lifeex_cont_2007

# group_by multiple variables: sum(pop), mean(lifeExp)

cont_year_pop <- gapminder %>%
                  group_by(year, continent) %>%
                  summarize(totalPop = sum(pop),
                            meanLifeExp = mean(lifeExp))
cont_year_pop

