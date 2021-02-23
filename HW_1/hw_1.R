library(tidyverse)
setwd("~/Intro_to_R/HW_1")

NEI <- read_rds ("summarySCC_PM25.rds")
SCC <- read_rds ("Source_Classification_Code.rds")

years <- filter (NEI, year %in% c(1999, 2002, 2005, 2008))

ggplot (years) + geom_point (mapping = aes (year, Emissions, fill=type))
