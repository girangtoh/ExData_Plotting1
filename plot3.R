hhPower <- read.table("./ExData_Plotting1/household_power_consumption.txt", 
                      skip = 66637, nrows = 2880, 
                      sep=';', na.strings="?", check.names=FALSE)

colnames(hhPower) = c("date", "time", "gActivePower", "gRPower", "voltage", 
                      "gIntensity", "sub1", "sub2", "sub3")

##format Date in the correct dd/mm/yyyy
hhPower$date <- as.Date(hhPower$date, format = "%d/%m/%Y")

datetime <- paste(as.Date(hhPower$date), hhPower$time)

## insert 1 more column to plot the points
hhPower$dateTime <- as.POSIXct(datetime)

par(mfrow = c(1,1))
with(hhPower, {
        plot(sub1~dateTime, type = "l",
             ylab = "Energy sub metering", xlab="")
        lines(sub2~dateTime, col = "red")
        lines(sub3~dateTime, col = "blue")
        
})

legend("topright", col = c("black", "red", "blue"), 
       lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "./ExData_Plotting1/plot3.png", 
         height = 480, width = 480, res = 55)
dev.off()