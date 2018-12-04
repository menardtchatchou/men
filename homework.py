import os
import csv
file_to_load = Os.path.join("Resources", "budget_data.csv")
file_to_output = os.path.join("analysis", "budget_analysis.txt")
total_months = 0
month_of_change = []
net_change_list = []
greatest_increase = ["", 0]
greatest_decrease = ["", 99999999999999]
total_net = 0
with open(file_to_load) as financial_data
    reader = csv.reader(financial_data)

    header = next(reader)

    first_row = next(reader)
    total_months = total_months + 1
    total_net = total_net + int(first_row[1])
    prev_net = int(first_row[1])

    for row in reader:
        total_months = total_months + 1
        total_net = total_net + int(row[1])

        net_change = int(row[1]) - prev_net
        prev_net = int(row[1])

        net_change_list = net_change_list + [net_change]
        month_of_change = month_of change + [row[0]]

        if net_change > greatest_increase[1]:
            greatest_increase[0 = row[0]]
            greatest_decrease[1] = net_change

        
