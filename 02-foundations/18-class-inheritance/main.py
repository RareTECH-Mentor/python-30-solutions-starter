# Q01: Base Class
# "Dog" という名前で Animal クラスのインスタンスを作成し、
# speak() メソッドを呼び出して結果を表示してください。
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        return f"{self.name} makes a sound"
# ここにコードを書いてください


# Q02: Inheritance
# Animal クラスを継承した Dog クラスを定義してください。
# speak() メソッドをオーバーライドして、"{name} barks" を返すようにしてください。
# "Buddy" という名前で Dog クラスのインスタンスを作成し、
# speak() メソッドを呼び出して結果を表示してください。
# ここにコードを書いてください


# Q03: Multiple Inheritance
# Animal クラスを継承した Cat クラスを定義してください。
# speak() メソッドをオーバーライドして、"{name} meows" を返すようにしてください。
# さらに、"{name} purrs" を返す purr() メソッドを追加してください。
# "Whiskers" という名前で Cat クラスのインスタンスを作成し、
# speak() と purr() メソッドを呼び出して結果を表示してください。
# ここにコードを書いてください