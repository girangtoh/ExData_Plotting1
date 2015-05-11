hhPower <- read.table("./ExData_Plotting1/household_power_consumption.txt", 
                      skip = 66637, nrows = 2880, 
                      sep=';', na.strings="?", check.names=FALSE)

colnames(hhPower) = c("date", "time", "gActivePower", "gRPower", "voltage", 
                      "gIntensity", "sub1", "sub2", "sub3")

##format Date in the correct dd/mm/yyyy
hhPower$date <- as.Date(hhPower$date, format = "%d/%m/%Y")

## paste the date and time together
datetime <- paste(as.Date(hhPower$date), hhPower$time)

hhPower$dateTime <- as.POSIXct(datetime)

par(mfrow = c(1,1))
plot(hhPower$gActivePower~hhPower$dateTime, type = "l", 
                        ylab = "Global Active Power (kilowatts)", xlab="")


dev.copy(png, file = "./ExData_Plotting1/plot2.png", height = 480, width = 480)
dev.off()
