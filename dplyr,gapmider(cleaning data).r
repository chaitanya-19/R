#we will know how to clean and do various operations on data using dplyr library 
#we will be using gapminder data set by using gapminer library
library(gapminder)
library(dplyr)
library(ggplot2)
#loading gapminder data into the system
data<-gapminder
#spliting the data with respect to years
split(data,data$year)
#first we will use pipe operator %>%
#then we will use filter to filter the data with respect to any coloumns
gapminder %>%
  filter(country=="India")
gapminder %>%
  filter(year==2002)
#now we will arrange the data in any order
gapminder %>%
  arrange(year)
#to arrange in desending order
gapminder %>%
  arrange(desc(year))
#now we will use both arange and filter together
gapminder %>%
  filter(year==2002) %>%
  arrange(desc(pop))
#mutate is used to change any variable
gapminder%>%
  mutate(pop=pop/100000)
#mutate is used to add new varibables
gapminder %>%
  mutate(gdp=gdpPercap*pop)
#now lets ut all three together
gapminder %>%
  filter(year==2002) %>%
   mutate(gdp=gdpPercap*pop) %>%
  arrange(desc(gdp))
#good job 
#we will learn to use summary
gapminder %>%
  summarize(meanLifeExp = mean(lifeExp))
#we will sumaize and use filter
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp))
#using multiple coloumns in summarize function
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))
#we will use group_by variable 
#instead of reruning the  code again and again this can be used
#we shd use filter 12 times in this case to get this output
gapminder %>%
  group_by(year) %>%
  summarize(meanLifeExp = mean(lifeExp))
#another example
# Find median life expectancy and maximum GDP per capita in each year
gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))
#we can use two variables in group_by
gapminder %>%
  group_by(year, continent) %>%
  summarize(meanpop = mean(pop),
            meanLifeExp = mean(lifeExp))
#using combination of filter group_by summarize
# Find median life expectancy and maximum GDP per capita in each continent in 1957
gapminder %>%
  filter(year==1957) %>%
  group_by(continent) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))
#we will now try to visulize the summarized data
#read ggplotbasics before diving in here
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(gdpPercap = mean(gdpPercap),
            meanLifeExp = mean(lifeExp))
by_year
#visualising
ggplot(by_year, aes(x = year, y = gdpPercap)) +geom_point()
#for  y to start from zero
ggplot(by_year, aes(x = year, y = gdpPercap)) +geom_point()+expand_limits(y = 0)
#for visulising data which is groued by two variables as done above
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(gdpPercap = mean(gdpPercap),
            meanLifeExp = mean(lifeExp))
by_year_continent
#visulasing using scatter graph
ggplot(by_year_continent, aes(x = year, y = gdpPercap, color = continent)) +
  geom_point() +
  expand_limits(y = 0)


