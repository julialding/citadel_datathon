urate <- monthly_transportation_statistics$Unemployment.Rate...Seasonally.Adjusted
pipeline <- monthly_transportation_statistics$Transportation.Employment...Pipeline.Transportation
water <- monthly_transportation_statistics$Transportation.Employment...Water.Transportation
rail <- monthly_transportation_statistics$Transportation.Employment...Rail.Transportation
air <- monthly_transportation_statistics$Transportation.Employment...Air.Transportation
transit <- monthly_transportation_statistics$Transportation.Employment...Transit.and.ground.passenger.transportation
truck <- monthly_transportation_statistics$Transportation.Employment...Truck.Transportation
year <- monthly_transportation_statistics$Year
month <- monthly_transportation_statistics$Month
dated <- year + month/12 - 1/24

plot(dated, gas_prices, type='l', lwd=1.5, col="blue", xlab="Year", ylab="Gas Prices($)", main = "Gas Price and Unemployment Rate 2005-2023", ylim=c(0.5))
par(new = TRUE)
plot(dated, urate, type='l', lwd=1.5, col="red", xlab="", ylab="Unemployment Rate", ylim=c(0,0.15))
print(cor(gas_prices, urate))
print(cov(gas_prices, urate))

plot (dated, pipeline, type='l', lwd=1.5, col="red", xlab="Year", ylab="Employed (1000s)", main="Employment in the Transportation Sector", ylim=c(0,1620))
par(new = TRUE)
plot (dated, rail, type='l', lwd=1.5, col="orange", xlab="", ylab="", ylim=c(0,1620), axes=FALSE)
par(new = TRUE)
plot (dated, air, type='l', lwd=1.5, col="yellow", xlab="", ylab="", ylim=c(0,1620), axes=FALSE)
par(new = TRUE)
plot (dated, transit, type='l', lwd=1.5, col="green", xlab="", ylab="", ylim=c(0,1620), axes=FALSE)
par(new = TRUE)
plot (dated, truck, type='l', lwd=1.5, col="blue", xlab="", ylab="", ylim=c(0,1620), axes=FALSE)
par(new = TRUE)
plot (dated, water, type='l', lwd=1.5, col="purple", xlab="", ylab="", ylim=c(0,1620), axes=FALSE)

plot (dated, pipeline, type='l', lwd=1.5, col="red", xlab="Year", ylab="Employed (1000s)", main = "Employment in the Transportation Sector")
par(new = TRUE)
plot (dated, gas_prices, type='l', lwd=1.5, col="grey", xlab="", ylab="", axes=FALSE)
print(cor(pipeline, gas_prices))

plot (dated, rail, type='l', lwd=1.5, col="orange", xlab="Year", ylab="Employed (1000s)", main = "Employment in the Transportation Sector")
par(new = TRUE)
plot (dated, gas_prices, type='l', lwd=1.5, col="grey", xlab="", ylab="", axes=FALSE)
print(cor(rail, gas_prices))

plot (dated, air, type='l', lwd=1.5, col="yellow", xlab="Year", ylab="Employed (1000s)", main = "Employment in the Transportation Sector")
par(new = TRUE)
plot (dated, gas_prices, type='l', lwd=1.5, col="grey", xlab="", ylab="", axes=FALSE)
print(cor(air, gas_prices))

plot (dated, transit, type='l', lwd=1.5, col="green", xlab="Year", ylab="Employed (1000s)", main = "Employment in the Transportation Sector")
par(new = TRUE)
plot (dated, gas_prices, type='l', lwd=1.5, col="grey", xlab="", ylab="", axes=FALSE)
print(cor(transit, gas_prices))

plot (dated, truck, type='l', lwd=1.5, col="blue", xlab="Year", ylab="Employed (1000s)", main = "Employment in the Transportation Sector")
par(new = TRUE)
plot (dated, gas_prices, type='l', lwd=1.5, col="grey", xlab="", ylab="", axes=FALSE)
print(cor(truck, gas_prices))

plot (dated, water, type='l', lwd=1.5, col="purple", xlab="Year", ylab="Employed (1000s)", main = "Employment in the Transportation Sector")
par(new = TRUE)
plot (dated, gas_prices, type='l', lwd=1.5, col="grey", xlab="", ylab="", axes=FALSE)
print(cor(water, gas_prices))