import csv
import requests
import re

from env.settings import CAREER_API_KEY

f = open("major.csv", "w", newline="")
wr = csv.writer(f)

url = "https://www.career.go.kr/cnet/openapi/getOpenApi?"

params = {
    "apiKey": CAREER_API_KEY,
    "svcType": "api",
    "svcCode": "MAJOR",
    "contentType": "json",
    "gubun": "univ_list",
    "perPage": "9999",
}

res = requests.get(url, params)

idx = 1

wr.writerow(["id", "name"])
test = []
if res.status_code == 200:
    data = res.json()
    for i in data["dataSearch"]["content"]:
        # for j in i["facilName"].split(","):
        #     wr.writerow([idx, j])
        #     idx += 1
        for j in re.sub(
            r"\(([^)]*)\)", lambda x: x.group().replace(",", "|"), i["facilName"]
        ).split(","):
            # wr.writerow([idx, j])
            test.append(j)
            # idx += 1

unique_result = list(set(test))
filtered_list = [x for x in unique_result if x != "" and x != " " and x is not None]
for i in filtered_list:
    if i == "" or i == " " or i is None:
        print(idx)
    wr.writerow([idx, i])
    idx += 1
f.close()
