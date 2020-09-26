
library(lubridate)

a <- read.table("household_power_consumption.txt", header= TRUE, sep = ";")


a[1] <- dmy_hms(paste(a[,1], a[,2]))

a <- a[,c(1,3,4,5,6,7,8,9)]

a <- a[which( year(a[, 1]) == 2007 & month(a[, 1]) == 02 & (day(a[, 1]) == 01 | day(a[, 1]) == 02) ) , ]
total_rows <- nrow(a)

a[2] <- as.numeric(unlist(a[2]))
a[3] <- as.numeric(unlist(a[3]))
a[4] <- as.numeric(unlist(a[4]))
a[5] <- as.numeric(unlist(a[5]))
a[6] <- as.numeric(unlist(a[6]))
a[7] <- as.numeric(unlist(a[7]))
a[8] <- as.numeric(unlist(a[8]))


png(file = "plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))

# plot1 row 1 column 1
plot(a$Global_active_power,type="l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = 'n' )
axis(side = 1, at =c(0, total_rows/2,total_rows), labels=c("Thu", "Fri", "Sat"), lwd=2 )
axis(side = 2, lwd = 2)

#plot2 row 1 column 2
plot(a$Voltage, type = "l", xlab="datetime", ylab="Voltage", xaxt="n")
axis(side=1, at =c(0, total_rows/2,total_rows), labels=c("Thu", "Fri", "Sat"), lwd=2 )
axis(side = 2, lwd = 2)

#plot3 row 2 column 1
plot(a$Sub_metering_1,  type="l", , xaxt = 'n', xlab = "", ylab = "Energy sub metering")
axis(side = 1, at =c(0, total_rows/2,total_rows), labels=c("Thu", "Fri", "Sat"), lwd =2)
axis(side = 2, lwd = 2)
lines(a$Sub_metering_2, col = "red")
lines(a$Sub_metering_3, col = "blue")
legend("topright", bty="n", lwd = 1, col=c("black","red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot4 row 2 column 2
plot(a$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power", xaxt="n", lwd=-1)
axis(side=1, at =c(0, total_rows/2,total_rows), labels=c("Thu", "Fri", "Sat"), lwd=2 )
axis(side = 2, lwd = 2)


dev.off()