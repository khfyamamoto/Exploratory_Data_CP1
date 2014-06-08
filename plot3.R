##      Exploratory Data Assignment 1: plot3.R
##      
##
#       roading the data
#       roading the data
        epcdata <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
#       using data 2007-02-02 and 2007-02-02        
        epc <- epcdata[(epcdata$Date == "1/2/2007" | epcdata$Date == "2/2/2007"), ]
        epc$datetime <- strptime(paste(epc$Date, epc$Time),format("%d/%m/%Y %H:%M:%S"))        
        epc$Global_active_power <- as.numeric(epc$Global_active_power)
        epc$Global_reactive_power <- as.numeric(epc$Global_reactive_power)
        epc$Voltage <- as.numeric(epc$Voltage)
        epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
        epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
        epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)
#       making Plots and saving
        png("plot3.png", width = 480, height = 480)
        plot(epc$datetime, epc$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
        with(epc, lines(datetime, Sub_metering_2, col = "red"))
        with(epc, lines(datetime, Sub_metering_3, col = "blue"))
        legend("topright", lty=1, lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
