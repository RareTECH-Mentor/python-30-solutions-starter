# 問３：戻り値のあるメソッドを作成しよう
# 以下に処理を記述してください

class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height
