getwd()
setwd("C:\\Users\\vaish\\Downloads\\exdata_data_NEI_data")
getwd()
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

#1.Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (fips == "24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question.

subsetNEI <- NEI[NEI$fips == "24510",]

totalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png("Plot2.png")

barplot(height = totalByYear$Emissions, names.arg = totalByYear$year, xlab = "years", ylab = expression('total PM'[2.5]*'emission'), main = expression('Total PM'[2.5]*'in the Baltimore City, MD emissions at various years'))
dev.off() 
