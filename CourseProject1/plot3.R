#download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household.zip")

#unzip file
unzip("household.zip")

my_file <- "C:\\Bindya\\DataScience\\Exploratory\\CourseProject1\\household_power_consumption.txt"
#my_file

# Read data set after unzipping the data file
Consumption <- read.table(my_file,header=T, sep=";",stringsAsFactors = FALSE, 
                          dec = ".")

# Household power consumption for 01/02/2007 and 02/02/2007
powerConsumption <- Consumption[as.character(Consumption$Date) %in% 
                                    c("1/2/2007", "2/2/2007"),]

# Concatante Date and Time variables
powerConsumption$dateTime <- paste(powerConsumption$Date, powerConsumption$Time, sep = " ")

# Convert to Date/Time class
powerConsumption$dateTime <- strptime(powerConsumption$dateTime, "%d/%m/%Y %H:%M:%S")
#attach(powerConsumption)

png("plot3.png", width=480, height=480)

# Plot Energy sub metering
plot(powerConsumption$dateTime, as.numeric(powerConsumption$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(powerConsumption$dateTime, as.numeric(powerConsumption$Sub_metering_2),type="l",  col="red")
lines(powerConsumption$dateTime, as.numeric(powerConsumption$Sub_metering_3), type="l",col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.off()



