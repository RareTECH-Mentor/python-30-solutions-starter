# Q1: `map` と `lambda` で数値リストを変換する
numbers_q1 = [1, 2, 3, 4, 5]

# map()はイテレータを返すため、list()でリストに変換する
squared_numbers = list(map(lambda x: x**2, numbers_q1))
print(squared_numbers)


# Q2: `filter` と `lambda` で条件に合う要素を抽出する
numbers_q2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# filter()もイテレータを返すため、list()でリストに変換する
even_numbers = list(filter(lambda x: x % 2 == 0, numbers_q2))
print(even_numbers)