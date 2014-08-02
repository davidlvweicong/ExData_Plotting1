data <- read.table("household_power_consumption.txt",
  sep = ";", header = TRUE, stringsAsFactors = FALSE)
t <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
data <- data[t, ]
png("plot2.png", width = 480, height = 480, units = "px",
    bg = "transparent")
with(data, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
  as.numeric(Global_active_power), type = "l", xlab = "",
  ylab = "Global Active Power (kilowatts)"))
dev.off()
