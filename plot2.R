setwd("C://Users//Nishanth//Desktop//Learning R programing")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
str(SCC)

# Aggregate
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)

## Question 2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.

NEIdataBaltimore<-subset(NEI, fips == "24510")
totalEmissionBaltimore <- aggregate(Emissions ~ year, NEIdataBaltimore, sum)
totalEmissionBaltimore

png(filename='C://Users//Nishanth//Desktop//Learning R programing/plot2.png')

barplot(
        (totalEmissionBaltimore$Emissions),
        names.arg=totalEmissionBaltimore$year,
        xlab='Year',
        ylab='PM2.5 Emissions [Tons]',
        main=expression('Total PM2.5 emissions from all Baltimore city sources')
)

dev.off()