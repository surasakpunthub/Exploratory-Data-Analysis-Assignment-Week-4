# set dataset directory
setwd("/Users/surasakpunthub/Desktop/Digital triz/R programing/Couse-4/W-4/Assignment/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# merge data
NEISCC <- merge(NEI, SCC, by="SCC")

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Searching for ON-ROAD type in NEI

subNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]

dataTotal <- aggregate(Emissions ~ year, subNEI, sum)

png('Plot5.png')
barplot(height=dataTotal$Emissions, names.arg=dataTotal$year, xlab="Year", ylab=expression('Total PM 2.5 Emissions'),main=expression('Total Emissions from motor vehicle'))
dev.off()
