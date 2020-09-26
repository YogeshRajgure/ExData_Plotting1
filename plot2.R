library(lubridate)

a <- read.table("household_power_consumption.txt", header= TRUE, sep = ";")

#colnames(a)

a[1] <- dmy_hms(paste(a[,1], a[,2]))
#class(a[1])
#a[2] <-  hms()
a <- a[,c(1,3,4,5,6,7,8,9)]

a <- a[which( year(a[, 1]) == 2007 & month(a[, 1]) == 02 & (day(a[, 1]) == 01 | day(a[, 1]) == 02) ) , ]
total_rows <- nrow(a)

a[2] <- as.numeric(unlist(a[2]))

png(file = "plot2.png", height = 480, width = 480)
plot(a$Global_active_power,type="l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = 'n' )
axis(side = 1, at =c(0, total_rows/2,total_rows), labels=c("Thu", "Fri", "Sat"))
dev.off()