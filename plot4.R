# Set locale
Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")

# Read file
rawData <- read.csv2('household_power_consumption.txt')

# Convert to R date format
rawData$Date <- as.Date(rawData$Date, format = '%d/%m/%Y')

# Filter relevant data
data <- rawData[rawData$Date >= as.Date('2007-02-01') & rawData$Date <= as.Date('2007-02-02'), ]

# Concat date and time to time object
time <- strptime(paste(data$Date, data$Time, sep = ' '), format = '%Y-%m-%d %H:%M:%S')

# Create histogram and store it
png(filename='figure/plot4.png', width = 480, height = 480)
par(mfcol = c(2, 2))

plot(time, as.numeric(as.character(data$Global_active_power)), xlab = '', ylab = 'Global Active Power', type='l')

with(data, plot(time, as.numeric(as.character(data$Sub_metering_1)), xlab = '', ylab = 'Energy sub metering', type='l'))
with(data, lines(time, as.numeric(as.character(data$Sub_metering_2)), col = 'RED'))
with(data, lines(time, as.numeric(as.character(data$Sub_metering_3)), col = 'BLUE'))
legend('topright', lty = c(1,1,1), bty = 'n', col = c('BLACK', 'RED', 'BLUE'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

plot(time, as.numeric(as.character(data$Voltage)), xlab = 'datetime', ylab = 'Voltage', type='l')

plot(time, as.numeric(as.character(data$Global_reactive_power)), xlab = 'datetime', ylab = 'Global_reative_power', type='l')

dev.off()