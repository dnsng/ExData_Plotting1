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

# histogram 2 (problem with axis - PT)
with(dataset2, plot(Time, Global_active_power, xlab = " ", ylab = "Global active power", pch = ".", lines(Time, Global_active_power)))
dev.copy(device = png, file = "plot2.png")
dev.off()