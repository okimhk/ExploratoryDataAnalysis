library(data.table)

#Read in data from the file then subset data for specific dates
powerDT <- data.table::fread(input = "C:/Users/Hykim/Desktop/Coursera Assignments/Course4/data/household_power_consumption.txt", na.strings="?")
head(powerDT)
str(powerDT)

#Prevent histogram from printing in scientific notation
powerDT[, Gloabl_reactive_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Change Date Column to Date Type
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[Date >= "2007-02-01" & Date <= "2007-02-02"]

png("plot1.png", width = 480, height = 480)

#Plot 1
hist(powerDT[,Global_active_power], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
dev.off()
