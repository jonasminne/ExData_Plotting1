# Read & Reduce Data
hpc <- read.csv("../../household_power_consumption.txt", sep=";", dec=".", header=TRUE, na.strings=c("?"));
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S");
data <- hpc[strptime(hpc$Date,"%d/%m/%Y") %in% c("2007-02-01","2007-02-02"),];

# Draw Chart
png("plot2.png", width=480, height=480);
par(mfrow=c(1,1));
with(data, {
        plot(DateTime, Global_active_power, main="", ylab="Global Active Power (kilowatts)", xlab="", type="l", col="black");   
});
dev.off();  