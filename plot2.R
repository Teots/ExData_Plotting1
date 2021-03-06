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
png(filename='figure/plot2.png', width = 480, height = 480)
plot(time, as.numeric(as.character(data$Global_active_power)), xlab = '', ylab = 'Global Active Power (kilowatts)', type='l')
dev.off()