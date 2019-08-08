# set dataset directory
setwd("/Users/surasakpunthub/Desktop/Digital triz/R programing/Couse-4/W-4/Assignment/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# merge data
NEISCC <- merge(NEI, SCC, by="SCC")

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# Find all NEISCC records with Short.Name (SCC) Coal
coal  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coal, ]

dataTotal <- aggregate(Emissions ~ year, subsetNEISCC, sum)

png('Plot4.png')
barplot(height=dataTotal$Emissions, names.arg=dataTotal$year, xlab="Year", ylab=expression('Total PM 2.5 Emissions'),main=expression('Total PM2.5 emissions from coal combustion'))
dev.off()