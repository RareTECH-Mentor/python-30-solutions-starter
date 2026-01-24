# Q01: Lambda Function
# lambda式を使って関数を定義してみましょう
square = lambda x: x ** 2
result = square(5)
print(result)

# Q02: Map Function
# map()関数を使ってリストの各要素を変換してみましょう
numbers = [1, 2, 3, 4, 5]
squared = list(map(lambda x: x ** 2, numbers))
print(squared)

# Q03: Filter Function
# filter()関数を使って条件に合う要素を抽出してみましょう
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
even_numbers = list(filter(lambda x: x % 2 == 0, numbers))
print(even_numbers)

