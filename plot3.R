library(data.table)

#Read in data from the file then subset data for specific dates
powerDT <- data.table::fread(input = "C:/Users/Hykim/Desktop/Coursera Assignments/Course4/data/household_power_consumption.txt", na.strings="?")
head(powerDT)
str(powerDT)

#Prevent histogram from printing in scientific notation
powerDT[, Gloabl_reactive_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Change Date Column to Date Type
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[dateTime >= "2007-02-01" & dateTime < "2007-02-03"]

png("plot3.png", width = 480, height = 480)

#Plot 3
with(powerDT, plot(dateTime, Sub_metering_1, type = "l", xlab="", ylab="Energy sub meeting"))
with(powerDT, lines(dateTime, Sub_metering_2, col="red"))
with(powerDT, lines(dateTime, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1))
dev.off()
