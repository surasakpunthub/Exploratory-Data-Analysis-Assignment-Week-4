# set dataset directory
setwd("/Users/surasakpunthub/Desktop/Digital triz/R programing/Couse-4/W-4/Assignment/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

dataTotal <- aggregate(Emissions ~ year, NEI, sum)

png('Plot1.png')
barplot(height=dataTotal$Emissions, names.arg=dataTotal$year, xlab="Year", ylab=expression('total PM2.5 emission'),main=expression('Total PM2.5 emissions each of the years'))
dev.off()