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
