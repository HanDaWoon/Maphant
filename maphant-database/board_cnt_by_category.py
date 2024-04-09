import csv

newF = open("board_cnt_by_category.csv", "w", newline="")
category = open("classification.csv", "r", encoding="utf-8")
boardType = [1,2,3,4,5,6,7]
wr = csv.writer(newF)

wr.writerow(["id", "category_id", "board_type_id", "cnt"])
category.readline()
idx = 1
# category의 id와 boardType을 조합하여 각각의 카테고리별 게시판의 개수를 구함
for i in category:
    i = i.strip().split(",")[0]
    for j in boardType:
        wr.writerow([idx, i, j, 0])
        idx += 1
newF.close()
category.close()