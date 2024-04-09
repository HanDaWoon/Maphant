from env.settings import CAREER_API_KEY
import tldextract
import csv
import requests

f = open("univ.csv", "w", newline="")
wr = csv.writer(f)

wr.writerow(["id", "name", "link"])

url = "https://www.career.go.kr/cnet/openapi/getOpenApi?"

params = {
    "apiKey": CAREER_API_KEY,
    "svcType": "api",
    "svcCode": "SCHOOL",
    "contentType": "json",
    "gubun": "univ_list",
    "perPage": "9999",
}

res = requests.get(url, params)


if res.status_code == 200:
    data = res.json()
    saved_domains = set()
    saved_names = set()
    cnt = 1

    for i, univ in enumerate(data["dataSearch"]["content"], 1):
        link = univ["link"]
        school_name = univ["schoolName"]

        domain = tldextract.extract(link)
        main_domain = domain.registered_domain.lower()

        if school_name not in saved_names and main_domain not in saved_domains:
            wr.writerow([cnt, school_name, main_domain])
            print(cnt, school_name, main_domain)
            cnt += 1
            saved_domains.add(main_domain)
            saved_names.add(school_name)

f.close()
