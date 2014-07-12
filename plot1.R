# Read file
rawData <- read.csv2('household_power_consumption.txt')

# Convert to R date format
rawData$Date <- as.Date(rawData$Date, format = '%d/%m/%Y')

# Filter relevant data
data <- rawData[rawData$Date >= as.Date('2007-02-01') & rawData$Date <= as.Date('2007-02-02'), ]

# Create histogram and store it
png(filename='figure/plot1.png', width = 480, height = 480)
hist(as.numeric(as.character(data$Global_active_power)), main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', col = 'RED')
dev.off()