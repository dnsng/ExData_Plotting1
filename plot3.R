#reading dataset (this may take some time)
dataset <- read.table("dataset.txt", header = 1, sep = ";", na.strings = "?") #downloaded data (renamed to "dataset")
dataset1 <- dataset[(dataset$Date == "1/2/2007") | (dataset$Date == "2/2/2007"),] #subsetted version of original dataset
rm(dataset)

# replacing time
dtval <- paste(dataset1$Date, dataset1$Time, sep = " ")
dtval_1 <- strptime(dtval, format= "%d/%m/%Y %H:%M:%S")
dataset2 <- dataset1 #intermediate data
write.csv(dataset1, file = "dataset1.csv") #saving a copy of intermediate data
rm(dataset1)
dataset2$Time <- dtval_1
dataset2$Date <- as.Date(dtval_1)

# histogram 3
with(dataset2, plot(Time, Sub_metering_1, col = 'black', pch =".", xlab = " ", ylab = "Energy sub metering", lines(Time, Sub_metering_1, col = 'black')))
with(dataset2, lines(Time, Sub_metering_2, col='red'))
with(dataset2, lines(Time, Sub_metering_3, col='blue'))
legend("topright", lty = c(1,1,1), cex = 0.75, col = c('black', 'red', 'blue'), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(device = png, file = "plot3.png")
dev.off()