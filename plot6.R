library(ggplot2)
setwd("C://Users//Nishanth//Desktop//Learning R programing")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
str(SCC)


## Question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data to Baltimore's fip
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
baltimoreVehiclesNEI$city <- "Baltimore"
LAVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
LAVehiclesNEI$city <- "Los Angeles"
combined <- rbind(LAVehiclesNEI,baltimoreVehiclesNEI)

png(filename='C://Users//Nishanth//Desktop//Learning R programing/plot6.png')

ggplot(combined, aes(x=factor(year), y=Emissions, fill=city)) +
geom_bar(stat="identity",fill="grey",width=0.75) + facet_grid(scales="free", space="free", .~city) +
guides(fill=FALSE) + theme_bw() + labs(x="year", y=expression("Total PM2.5 emission (Kilo-Tons)")) + 
labs(title=expression("PM2.5 motor vehicle source emissions in Baltimore & Los Angeles"))

dev.off()
