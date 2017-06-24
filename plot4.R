library(ggplot2)
setwd("C://Users//Nishanth//Desktop//Learning R programing")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
str(SCC)

# Subset coal combustion related NEI data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]


## Question 4:
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?

png(filename='C://Users//Nishanth//Desktop//Learning R programing/plot4.png')

ggplot(combustionNEI,aes(factor(year),Emissions/100)) + geom_bar(stat="identity",fill="grey",width=0.75) +
theme_bw() +  guides(fill=FALSE) + labs(x="Year", y=expression("Total PM2.5 Emission [kiloTons]")) + 
labs(title=expression("PM2.5 Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()
