library(tidyverse)
setwd("~/Intro_to_R/HW_1")

NEI <- read_rds ("summarySCC_PM25.rds")
SCC <- read_rds ("Source_Classification_Code.rds")



#Question 1: Have total emissions from PM2.5 decreased in the US from 99 to 08? Using the base plotting
#system, make a plot showing the total PM2.5 emission from all sources for each of the years 99, 02, 05, 08.

nei <- aggregate(Emissions ~ year, NEI, sum)

plot(nei$year, nei$Emissions, type = "o", col = "blue",
     main = "Total PM 2.5 Emission From 1999 to 2008", xlab = "Year", ylab = "Emissions")



#Question 2: Have total emissions from PM2.5 decreased in San Antonio (fips=="48029") from 99-08?

sa <- subset(NEI, NEI$fips == "48029")

total_sa <- aggregate(Emissions ~ year, sa, sum)

ggplot (total_sa, mapping = aes(year, Emissions)) +
  ggtitle (expression("Total Emissions from PM 2.5 in San Antonio (1999-2008)")) +
          geom_point () +
        geom_smooth()


#Question 3: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
#variable, which of these four sources have seen decreases in emissions from 1999-2008 for SA? Increases?

type_sa <- aggregate(Emissions ~ year + type, sa, sum)

ggplot (type_sa, mapping = aes (year, Emissions, col = type)) + 
  ggtitle (expression("Emissions by Type in San Antonio (1999-2008)")) +
  geom_point () + 
  geom_line()

#Question 4: Across the United States, how have emissions from coal combustion-related sources changed
#from 99-08?

ggplot (SCC)

#Question 5: How have emissions from  motor vehicle sources changed from 99-08 in SA?
cars <- filter(type_sa, type == "ON-ROAD")
mv_sa <- aggregate(Emissions ~ year + cars, sa, sum)

#ggplot (type_sa, mapping = aes (year, Emissions, col = type)) + 
  ggtitle (expression("Emissions by Type in San Antonio (1999-2008)")) +
  geom_point () + 
  geom_line()

#Question 6: Compare emissions from motor vehicle sources in SA with emissions from motor vehicle sources
#in LA County (fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?