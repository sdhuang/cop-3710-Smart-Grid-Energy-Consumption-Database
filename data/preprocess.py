import csv

def dateTime(date, time):
    temp = date.split('/')
    if (len(temp) < 3):
        return 'date_time'
    if (len(temp[0]) < 2):
        temp[0] = '0' + temp[0]
    if (len(temp[1]) < 2):
        temp[1] = '0' + temp[1]
    return temp[2] + '-' + temp[1]  + '-' + temp[0] + ' ' + time

with open('household_power_consumption.txt', newline='') as toRead:
    readLines = csv.reader(toRead, delimiter=';')
    with open('usage.csv', 'w', newline='') as toWrite:
        writeLine = csv.writer(toWrite, delimiter=',')
        i = True
        for row in readLines:
            if i:
                writeLine.writerow([dateTime(row[0], row[1]), 'mtr_id', 'active', 'reactive', 'voltage', 'intensity', 'sub_meter_1', 'sub_meter_2', 'sub_meter_3'])
                i = False
                continue
            writeLine.writerow([dateTime(row[0], row[1]), 1] + row[2:])
