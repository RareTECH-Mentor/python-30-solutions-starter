# 問１：標準ライブラリをimportしよう
# 以下に処理を記述してください
import math
print(f"25の平方根は{math.sqrt(25)}です")


# 問２：モジュール内の特定のプログラムをimportしよう
# 以下に処理を記述してください
from math import pi
print(f"円周率は{pi}です")


# 問３：asを使って別名をつけてみよう
# 以下に処理を記述してください
import random as r
print(r.randint(1, 6))


# 問４：自作モジュールを作成しよう
# 以下に処理を記述してください
import greet
greet.hello("Python")
