library(tidyverse)
library(car)

monthly_transportation_statistics <- read.csv("monthly_transportation_statistics.csv")
unemploy <- monthly_transportation_statistics[,c(2, 3, 98)]
unemployment <- na.omit(unemploy)
names(unemployment)[names(unemployment)=="Unemployment.Rate...Seasonally.Adjusted"] <- "unemployment"
employment <- unemployment
employment$unemployment <- 1-employment$unemployment
names(employment)[names(employment)=="unemployment"] <- "employment"

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

stock <- read.csv("S&P500 Index Max.csv")
stock <- stock[,c(1,2)]
names(stock)[names(stock)=="Close.Last"] <- "stock"
stock <- cbind(stock, str_split(stock$Date, "/", simplify = TRUE))
colnames(stock)[ncol(stock)-2:ncol(stock)] <- c("Month", "Day", "Year")
names(stock)[names(stock)=="Day"] <- "stock"
names(stock)[names(stock)=="Year"] <- "Date"
names(stock)[names(stock)=="2"] <- "Day"
names(stock)[names(stock)=="3"] <- "Year"
stock$Day <- as.numeric(stock$Day)
stock$Month <- as.numeric(stock$Month)
stock$Year <- as.numeric(stock$Year)
stock <- stock[order(stock$Year, stock$Month, stock$Day),]
stock <- stock[,c(3,5,2)]

gdp <- monthly_transportation_statistics[,c(2, 3, 101)]
names(gdp)[names(gdp)=="Real.Gross.Domestic.Product...Seasonally.Adjusted"] <- "real_gdp"
gdp$real_gdp <- as.numeric(gdp$real_gdp)


employment_anova <- merge(x=employment, y=stock, by=c("Month", "Year"), all=TRUE)
employment_anova <- merge(employment_anova, gas, by=c("Month", "Year"), all=TRUE)
employment_anova <- merge(employment_anova, gdp, by=c("Month", "Year"), all=TRUE)
employment_anova <- na.omit(employment_anova)



regression <- lm(employment ~ stock + gas + real_gdp, data = employment_anova) #multiple linear regression model
anova_test <- aov(regression) #perform anova test
anova_result <- Anova(regression) # analyze anova result
print(anova_result)