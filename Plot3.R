# set dataset directory
setwd("/Users/surasakpunthub/Desktop/Digital triz/R programing/Couse-4/W-4/Assignment/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question. Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

# From fips = 24510 is Baltimore
dataTotal_tpye <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png('Plot3.png')
g <- ggplot(dataTotal_tpye, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression("Total PM 2.5 Emissions")) +
  ggtitle('Total PM2.5 emissions in the Baltimore City')
print(g)
dev.off()




