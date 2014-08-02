data <- read.table("household_power_consumption.txt",
  sep = ";", header = TRUE, stringsAsFactors = FALSE)
t <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
data <- data[t, ]
png("plot4.png", width = 480, height = 480, units = "px",
    bg = "transparent")
t <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))
plot(t, as.numeric(data$Global_active_power), type = "l",
  xlab = "", ylab = "Global Active Power")
plot(t, as.numeric(data$Voltage), type = "l", xlab = "datetime",
  ylab = "Voltage")
plot(t, as.numeric(data$Sub_metering_1), type = "l",
  col = "black", xlab = "", ylab = "Energy sub metering")
points(t, as.numeric(data$Sub_metering_2), type = "l", col = "red")
points(t, as.numeric(data$Sub_metering_3), type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
  legend = paste("Sub_metering_", c(1, 2, 3), sep = ""), bty = "n")
plot(t, as.numeric(data$Global_reactive_power), type = "l",
  xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
