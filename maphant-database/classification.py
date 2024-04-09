import csv


txt = open("csf.txt", "r")
f = open("classification.csv", "w", newline="")

wr = csv.writer(f)

wr.writerow(["id", "name", "cnt"])

data = txt.readlines()

for i, classification in enumerate(data,1):
    wr.writerow([i, classification.strip().split(" ")[0], 0])
