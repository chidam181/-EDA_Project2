library(ggplot2)
setwd("C://Users//Nishanth//Desktop//Learning R programing")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
str(SCC)

## Question 5:
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data to Baltimore's fip
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]

png(filename='C://Users//Nishanth//Desktop//Learning R programing/plot5.png')

ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) + 
        geom_bar(stat="identity",fill="grey",width=0.75) + theme_bw() +  guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM2.5 Emission [kiloTons]")) + 
        labs(title=expression("PM2.5 motor vehicle source emissions in Baltimore from 1999-2008"))

dev.off()