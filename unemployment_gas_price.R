library(tidyverse)

gas <- read.csv("monthly_average_gas_prices.csv")
names(gas)[names(gas)=="Average.Gas.Price"] <- "gas"
gas[] <- lapply(gas, function(x) gsub("Jan", "1", x))
gas[] <- lapply(gas, function(x) gsub("Feb", "2", x))
gas[] <- lapply(gas, function(x) gsub("Mar", "3", x))
gas[] <- lapply(gas, function(x) gsub("Apr", "4", x))
gas[] <- lapply(gas, function(x) gsub("May", "5", x))
gas[] <- lapply(gas, function(x) gsub("Jun", "6", x))
gas[] <- lapply(gas, function(x) gsub("Jul", "7", x))
gas[] <- lapply(gas, function(x) gsub("Aug", "8", x))
gas[] <- lapply(gas, function(x) gsub("Sep", "9", x))
gas[] <- lapply(gas, function(x) gsub("Oct", "10", x))
gas[] <- lapply(gas, function(x) gsub("Nov", "11", x))
gas[] <- lapply(gas, function(x) gsub("Dec", "12", x))


monthly_transportation_statistics <- read.csv("monthly_transportation_statistics.csv")
unemploy <- monthly_transportation_statistics[,c(2, 3, 98)]
unemployment <- na.omit(unemploy)
names(unemployment)[names(unemployment)=="Unemployment.Rate...Seasonally.Adjusted"] <- "unemployment"

gas_unemployment <- merge(x=gas, y=unemployment, by=c("Month", "Year"), all=TRUE)
gas_unemployment <- na.omit(gas_unemployment)
gas_unemployment$Month <- as.numeric(gas_unemployment$Month)
gas_unemployment$Year <- as.numeric(gas_unemployment$Year)

gas_unemployment <- gas_unemployment[order(gas_unemployment$Year, gas_unemployment$Month),]

model <- lm(formula = unemployment ~ gas, data = gas_unemployment)
summary(model)
plot(gas_unemployment$gas, gas_unemployment$unemployment,
     xlab = "Gas Price (Dollars)", ylab = "Seasonally Adjusted Unemployment Rate",
     main = "Unemployment Rate vs. Gas Price (2005-2022)")
