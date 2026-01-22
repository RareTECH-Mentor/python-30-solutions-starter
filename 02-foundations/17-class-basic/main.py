# 問２：インスタンスを作成してみよう
# 以下に処理を記述してください
from person import Person

person1 = Person("次郎", 20)
person1.say_hello()
person1.introduce()


# 問４：戻り値を出力しよう
# 以下に処理を記述してください
from rectangle import Rectangle

rectangle1 = Rectangle(3, 4)
area = rectangle1.area()
print(f"辺の長さが{rectangle1.width}と{rectangle1.height}の四角の面積は{area}です")