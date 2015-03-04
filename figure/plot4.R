# Read & Reduce Data
hpc <- read.csv("../../household_power_consumption.txt", sep=";", dec=".", header=TRUE, na.strings=c("?"));
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S");
data <- hpc[strptime(hpc$Date,"%d/%m/%Y") %in% c("2007-02-01","2007-02-02"),];

# Draw Chart
png("plot4.png", width=480, height=480);
par(mfrow=c(2,2));
with(data, {
        # First one
        plot(DateTime, Global_active_power, main="", ylab="Global Active Power (kilowatts)", xlab="", type="l", col="black");
        
        # Second one
        plot(DateTime, Voltage, main="", ylab="Voltage", xlab="", type="l", col="black");
        
        #Third one
        plot(DateTime, Sub_metering_1, main="", ylab="Energy sub metering", xlab="", type="l", col="black");
        lines(DateTime, Sub_metering_2, col="red");
        lines(DateTime, Sub_metering_3, col="blue");
        legend("topright", pch="-", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")); 
        
        #Fourth one
        plot(DateTime, Global_reactive_power, main="", ylab="Global Reactive Power (kilowatts)", xlab="", type="l", col="black");
});
dev.off();