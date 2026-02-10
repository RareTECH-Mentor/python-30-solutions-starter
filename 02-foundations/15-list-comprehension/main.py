# 問１：数値を2倍しよう
# 以下に処理を記述してください
original_numbers = [1, 2, 3, 4, 5]
doubled_numbers = [number * 2 for number in original_numbers]

print("問1:", doubled_numbers)


# 問２：偶数だけを取り出してみよう
# 以下に処理を記述してください
mixed_numbers = [1, 2, 3, 4, 5, 6]
even_numbers = [number for number in mixed_numbers if number % 2 == 0]
print("問2:", even_numbers)


# 問３：文字列の長さをリストにしてみよう
# 以下に処理を記述してください
fruit_names = ["apple", "banana", "cherry"]
name_lengths = [len(name) for name in fruit_names]
print("問3:", name_lengths)


# 問４：大文字に変換してみよう
# 以下に処理を記述してください
lowercase_names = ["alice", "bob", "charlie"]
uppercase_names = [name.upper() for name in lowercase_names]
print("問4:", uppercase_names)


# 問５：0〜9 の平方数リストを作成しよう
# 以下に処理を記述してください
numbers_zero_to_nine = range(10)
square_numbers = [number ** 2 for number in numbers_zero_to_nine]
print("問5:", square_numbers)


# 問6：条件付きで値を変えてみよう
# 以下に処理を記述してください
scores = [5, 12, 8, 20]
pass_fail_labels = ["OK" if score >= 10 else "NG" for score in scores]
print("問6:", pass_fail_labels)
