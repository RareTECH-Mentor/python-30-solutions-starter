# 問１：例外処理をしてみよう
# 以下に処理を記述してください
try:
    num = int(input("整数を入力してください："))
    print(f"入力された数値は{num}です")
except ValueError:
    print("入力された値を整数に変換できません。整数を入力してください。")


# 問２：正しい入力まで繰り返す処理をしてみよう
# 以下に処理を記述してください
while True:
    try:
        num = int(input("整数を入力してください："))
        print(f"入力された数値は{num}です")
        break
    except ValueError:
        print("入力された値を整数に変換できません。整数を入力してください。")
