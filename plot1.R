library(lubridate)

a <- read.table("household_power_consumption.txt", header= TRUE, sep = ";")


a[1] <- dmy_hms(paste(a[,1], a[,2]))
a <- a[,c(1,3,4,5,6,7,8,9)]

a <- a[which( year(a[, 1]) == 2007 & month(a[, 1]) == 02 & (day(a[, 1]) == 01 | day(a[, 1]) == 02) ) , ]
total_rows <- nrow(a)

a[2] <- as.numeric(unlist(a[2]))

png(file = "plot1.png", height = 480, width = 480)
hist(a$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()