setwd("C://Users//Nishanth//Desktop//Learning R programing")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
str(SCC)

# Aggregate
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

## Question 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

png(filename='C://Users//Nishanth//Desktop//Learning R programing/plot1.png')

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total emissions of PM2.5 from all US sources'),
        xlab='Year', ylab=expression(paste('Total PM2.5 emissons [kiloTons]')))

dev.off()
