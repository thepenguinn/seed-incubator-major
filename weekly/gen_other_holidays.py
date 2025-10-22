import holidays
import sys

years = []

try:
    for arg in sys.argv[1:]:
        years.append(arg)
except IndexError:
    pass

india_holidays = holidays.country_holidays('IN', subdiv = 'KL', years = years)

for date in india_holidays:
    print(date)
