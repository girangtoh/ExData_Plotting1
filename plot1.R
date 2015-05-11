
hhPower <- read.table("./ExData_Plotting1/household_power_consumption.txt", 
                      skip = 66637, nrows = 2880, 
                      sep=';', na.strings="?", check.names=FALSE)

colnames(hhPower) = c("date", "time", "gActivePower", "gRPower", "voltage", 
                      "gIntensity", "sub1", "sub2", "sub3")

par(mfrow = c(1,1))
hist(hhPower$gActivePower, main = "Global Active Power", 
                               xlab = "Global Active Power (kilowatts)", 
                                col = "red")

dev.copy(png, file = "./ExData_Plotting1/plot1.png", height = 480, width = 480)
dev.off()