#download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household.zip")

#unzip file
unzip("household.zip")
my_file <- "C:\\Bindya\\DataScience\\Exploratory\\CourseProject1\\household_power_consumption.txt"
#my_file

# Read data set after unzipping the data file
Consumption <- read.table(my_file,header=T, sep=";")

# Household power consumption for 01/02/2007 and 02/02/2007
powerConsumption <- Consumption[as.character(Consumption$Date) %in% c("1/2/2007", "2/2/2007"),]

# Concatante Date and Time variables
powerConsumption$dateTime = paste(powerConsumption$Date, powerConsumption$Time)

# Convert to Date/Time class
powerConsumption$dateTime <- strptime(powerConsumption$dateTime, "%d/%m/%Y %H:%M:%S")
#attach(powerConsumption)

png("plot1.png", width=480, height=480, units="px")
# Plot the distribution of global active power
hist(as.numeric(as.character(Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
# Household power consumption for Feb1 2007 and  Fe2 2007 


