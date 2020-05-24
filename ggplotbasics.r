#we will see how to visulize data using ggplot2
#first we have to load library to use it
library(ggplot2)
# Create gapminder_1952
#we are storing the data whoose year is 1952
gapminder_1952<-gapminder %>%
  filter(year==1952)
#creating a graph
#first argument is about data 
#second is content of both axis
#third one after plus represent wt kind of grap in this case scatter
ggplot(gapminder_1952, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()
#scaling the x axis by log i.e x<-log(x)

ggplot(gapminder_1952, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()+scale_x_log10()
  
#scaling both x and y axis
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point()+scale_x_log10()+scale_y_log10()
#adding colour to the plot whcih represents another variable here continent
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap, color=continent)) +
  geom_point()+scale_x_log10()+scale_y_log10()
#adding another variable which is represented by the size of the dot 
ggplot(gapminder_1952, aes(x = gdpPercap, y = lifeExp ,color=continent ,size=pop)) +
  geom_point()+scale_x_log10()
#we now use faceting-it splits up the graph into multiple graphs based on faceting varibale assigned
ggplot(gapminder_1952, aes(x = gdpPercap, y = lifeExp )) +
  geom_point()+scale_x_log10()+facet_wrap(~continent)
# Scatter plot comparing gdpPercap and lifeExp, with color representing continent
# and size representing population, faceted by year
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp ,color=continent )) +
  geom_point()+scale_x_log10()+facet_wrap(~year)
#creating line plot
library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize the median gdpPercap by year, then save it as by_year
by_year<-gapminder %>%
  group_by(year)%>%
  summarize(medianGdpPercap=median(gdpPercap))

# Create a line plot showing the change in medianGdpPercap over time
ggplot(by_year, aes(x = year, y = medianGdpPercap)) +
  geom_line()
#another example
# Summarize the median gdpPercap by year & continent, save as by_year_continent
by_year_continent<-gapminder %>%
  group_by(continent,year) %>%
  summarize(medianGdpPercap=median(gdpPercap))


# Create a line plot showing the change in medianGdpPercap by continent over time
ggplot(by_year_continent, aes(x = year, y = medianGdpPercap,color=continent)) +
  geom_line()+expand_limits(y = 0)
#bar plots
#note that in bar X SHOULD BE A STING OR CHARACTE WHICH IS REPEATED i.e THERE AREONLY MIN
#NUMBER WE CANT CHOOSE POP AS X AS IT HAS UNIQUE VALUES TRY TO THINK U LITTLE SHIT
#summarizing mean life exp by continent in the year 2007
by_continent <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(meanLifeExp = mean(lifeExp))
by_continent
#creating bar plot
ggplot(by_continent, aes(x = continent, y = meanLifeExp)) +geom_col()
#another example
# Summarize the median gdpPercap by continent in 1952
by_continent<-gapminder %>%
  filter(year==1952)%>%
  group_by(continent)%>%
  summarize(medianGdpPercap=median(gdpPercap))

# Create a bar plot showing medianGdp by continent
ggplot(by_continent, aes(x = continent, y = medianGdpPercap)) +geom_col()
#creating hihstogram
#HISTOGRAMS
library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952) %>%
  mutate(pop_by_mil = pop / 1000000)

# Create a histogram of population (pop_by_mil)
ggplot(gapminder_1952, aes(x = pop_by_mil)) +
  geom_histogram(bins=50)
#BOX PLOTS
gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a boxplot comparing gdpPercap among continents
ggplot(gapminder_1952, aes(y=gdpPercap,x = continent)) +
  geom_boxplot()+scale_y_log10()
#another example with titles
gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Add a title to this graph: "Comparing GDP per capita across continents"
p<-ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10()
p + ggtitle("Comparing GDP per capita across continents")+ xlab("continent") + ylab("gdp per cap")
