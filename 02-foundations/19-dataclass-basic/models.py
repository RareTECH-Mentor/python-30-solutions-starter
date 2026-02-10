# 事前準備：データクラスのインポート
# 以下に処理を記述してください
from dataclasses import dataclass


# 問１：
    # Personクラスをデータクラスを使用して定義してください
# 以下に処理を記述してください
@dataclass
class Person:
    name: str
    age: int


# 問３：
    # 3-1. Userクラスをデータクラスを使用して定義してください
# 以下に処理を記述してください
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age


# 問４：
    # 4-1. Bookクラスをデータクラスを使用して定義してください
# 以下に処理を記述してください
@dataclass
class Book:
    title: str
    price: int = 0

    def discount(self, rate: int) -> int:
        return self.price * (100 - rate) // 100
