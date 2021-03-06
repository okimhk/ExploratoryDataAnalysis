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

png("plot2.png", width = 480, height = 480)

#Plot 1
plot(x = powerDT[,dateTime], y = powerDT[,Global_active_power],
     type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
