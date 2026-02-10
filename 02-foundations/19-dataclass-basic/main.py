from models import Person, Book, User

# 問２：インスタンスを作成して表示しよう
person = Person("Alice", 20)
print(person)


# 問３：
  # 3-2. ユーザーインスタンスを作成し、`print`でインスタンスの`name`と`age`を表示してください
# 以下に処理を記述してください
user1 = User("Bob",35)
print(f"名前：{user1.name}")
print(f"年齢：{user1.age}")


# 問４：
  # 4-2. Bookクラスから各インスタンスを作成し、`print`で表示してください
# インスタンス１を作成して表示してください
# 以下に処理を記述してください
book1 = Book("Python入門")
print(book1)

# インスタンス２を作成して表示してください
# 以下に処理を記述してください
book2 = Book("JavaScript基礎", 1300)
print(book2)



# 問５：
  # 5-2. インスタンスを作成した後、20%の割引後の金額を表示してください
# 以下に処理を記述してください
book3 = Book("AWS実践", 1000)
discounted_price = book3.discount(20)
print(discounted_price)