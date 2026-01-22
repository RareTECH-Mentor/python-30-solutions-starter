# 問１：クラスを作成してみよう
# 以下に処理を記述してください

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def say_hello(self):
        print(f"私の名前は{self.name}です")
    def introduce(self):
        print(f"私の年齢は{self.age}歳です")