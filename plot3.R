library(lubridate)

a <- read.table("household_power_consumption.txt", header= TRUE, sep = ";")

#colnames(a)

a[1] <- dmy_hms(paste(a[,1], a[,2]))
#class(a[1])
#a[2] <-  hms()
a <- a[,c(1,3,4,5,6,7,8,9)]

a <- a[which( year(a[, 1]) == 2007 & month(a[, 1]) == 02 & (day(a[, 1]) == 01 | day(a[, 1]) == 02) ) , ]
total_rows <- nrow(a)

a[6] <- as.numeric(unlist(a[6]))
a[7] <- as.numeric(unlist(a[7]))
a[8] <- as.numeric(unlist(a[8]))

png(file = "plot3.png", height = 480, width = 480)
plot(a$Sub_metering_1,  type="l", , xaxt = 'n', xlab = "", ylab = "Energy sub metering")
axis(side = 1, at =c(0, total_rows/2,total_rows), labels=c("Thu", "Fri", "Sat"), lwd =2)
axis(side = 2, lwd = 2)
lines(a$Sub_metering_2, col = "red")
lines(a$Sub_metering_3, col = "blue")
legend("topright", lwd=2, col=c("black","red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()