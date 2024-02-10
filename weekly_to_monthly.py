import csv
from collections import defaultdict

monthly_prices = defaultdict(list)

with open('weekly_gasoline_prices.csv', 'r') as infile:
    reader = csv.reader(infile, delimiter=',')
    next(reader)
    for row in reader:
        date_str, year, type, type_clean, unit, geography, price = row
        if len(price) >= 2 and type_clean == "Regular Conventional Retail Gasoline Prices" and geography == "US":
            month_year = date_str.split()[0] + ' ' + year  # Extract month and year
            monthly_prices[month_year].append(float(price))

monthly_averages = {month_year: sum(prices) / len(prices) for month_year, prices in monthly_prices.items()}

with open('monthly_average_gas_prices.csv', 'w', newline='') as outfile:
    writer = csv.writer(outfile)
    writer.writerow(['Month', 'Year', 'Average Gas Price'])
    for month_year, average_price in monthly_averages.items():
        month, year = month_year.split()
        writer.writerow([month, year, round(average_price, 2)])
