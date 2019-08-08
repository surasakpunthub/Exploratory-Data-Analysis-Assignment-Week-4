# set dataset directory
setwd("/Users/surasakpunthub/Desktop/Digital triz/R programing/Couse-4/W-4/Assignment/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

subsetNEI  <- NEI[NEI$fips=="24510", ]

dataTotal <- aggregate(Emissions ~ year, subsetNEI, sum)

png('Plot2.png')
barplot(height=dataTotal$Emissions, names.arg=dataTotal$year, xlab="Year", ylab=expression('total PM2.5 emission'),main=expression('Total PM2.5 emissions decreased in the Baltimore City'))
dev.off()