hhPower <- read.table("./ExData_Plotting1/household_power_consumption.txt", 
                      skip = 66637, nrows = 2880, 
                      sep=';', na.strings="?", check.names=FALSE)

colnames(hhPower) = c("date", "time", "gActivePower", "gRPower", "voltage", 
                      "gIntensity", "sub1", "sub2", "sub3")

##format Date in the correct dd/mm/yyyy
hhPower$date <- as.Date(hhPower$date, format = "%d/%m/%Y")

## paste the date and time together
datetime <- paste(as.Date(hhPower$date), hhPower$time)

## insert 1 more column to plot the points
hhPower$dateTime <- as.POSIXct(datetime)

par(mfrow= c(2, 2))
with(hhPower, {
        ##1st Graph, code from Plot2.R
        plot(gActivePower~dateTime, type = "l",
                ylab = "Global Active Power", xlab = "")
        ##2nd Graph, Plot Voltage against date time
        plot(voltage~dateTime, type = "l",
                ylab = "Voltage", xlab = "datetime")
        ##3rd Graph, code from Plot3.R
        plot(sub1~dateTime, type = "l",
             ylab = "Energy sub metering", xlab="")
        lines(sub2~dateTime, col = "red")
        lines(sub3~dateTime, col = "blue")
        legend("topright", col = c("black", "red", "blue"), 
                lty = 1, lwd = 2, cex = 0.6, pt.cex = 1, bty = "n",
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        ##4th Graph, Plot Global reactive Power against date time
        plot(gRPower~dateTime, type = "l",
             ylab= "Global_reactive_power", xlab = "datetime")

})

dev.copy(png, file = "./ExData_Plotting1/plot4.png", 
         height = 480, width = 480, res = 50)
dev.off()