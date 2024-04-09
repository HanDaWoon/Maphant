import requests
import csv

url = "http://127.0.0.1:10080/user"


def signUp():
    body = {
        "email": "test",
        "password": "test!@",
        "passwordCheck": "test!@",
        "nickname": "test",
        "name": "test",
        "sno": "1234",
        "univName": "경성대학교",
    }

    # body의 내용에 변수를 넣고 새로운 딕셔너리를 리턴 함수
    def addNumUser(num):
        tmp = body.copy()
        tmp["email"] = body["email"] + str(num) + "@ks.ac.kr"
        tmp["password"] = body["password"] + str(num)
        tmp["passwordCheck"] = body["passwordCheck"] + str(num)
        tmp["nickname"] = body["nickname"] + str(num)
        tmp["name"] = body["name"] + str(num)
        tmp["sno"] = body["sno"] + str(num)
        return tmp

    for i in range(100):
        print(addNumUser(i))
        response = requests.post(url + "signup/", json=addNumUser(i))
        print(response.status_code)
        print(response.text)

    return "success"


def categoty():
    body = {"email": "test", "category": "금속공학", "major": "금속공학전공"}

    def addNumCategory(num):
        tmp = dict()
        tmp = body["email"] + str(num) + "@ks.ac.kr"
        return tmp

    for i in range(100):
        response = requests.post(
            url + "/selection/categorymajor",
            addNumCategory(i),
        )
        print(response.status_code)
        print(response.text)
        print(i)


def signIn():
    f = open("token.csv", "w", newline="")
    wr = csv.writer(f)

    body = {"email": "test", "password": "test!@"}

    def addNumSignIn(num):
        tmp = body.copy()
        tmp["email"] = body["email"] + str(num) + "@ks.ac.kr"
        tmp["password"] = body["password"] + str(num)
        return tmp

    for i in range(100):
        bd = addNumSignIn(i)
        response = requests.post(url + "/login", json=bd)
        wr.writerow([bd, response.text])
        print(response.status_code)
        print(response.text)
        print(i)

    return "success"
