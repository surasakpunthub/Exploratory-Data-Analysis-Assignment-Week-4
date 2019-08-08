# set dataset directory
setwd("/Users/surasakpunthub/Desktop/Digital triz/R programing/Couse-4/W-4/Assignment/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# merge data
NEISCC <- merge(NEI, SCC, by="SCC")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?



# 24510 is Baltimore, see plot2.R, 06037 is LA CA
# Searching fips and ON-ROAD type in NEI

subNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD", ]

dataTotal_Fips <- aggregate(Emissions ~ year + fips, subNEI, sum)
dataTotal_Fips$fips[dataTotal_Fips$fips=="24510"] <- "Baltimore"
dataTotal_Fips$fips[dataTotal_Fips$fips=="06037"] <- "Los Angeles"

png("Plot6.png", width=1040, height=480)
g <- ggplot(dataTotal_Fips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM 2.5 Emissions')) +
  ggtitle('Comparision of Total Emissions from motor vehicle in Baltimore City VS Los Angeles 1999-2008')
print(g)
dev.off()


