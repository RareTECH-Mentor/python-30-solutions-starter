# Q01: Base Class
# 基底クラスを定義してみましょう
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        return f"{self.name} makes a sound"

animal = Animal("Dog")
print(animal.speak())

# Q02: Inheritance
# クラスを継承してみましょう
class Dog(Animal):
    def speak(self):
        return f"{self.name} barks"

dog = Dog("Buddy")
print(dog.speak())

# Q03: Multiple Inheritance
# 複数のメソッドを持つ継承クラスを作成してみましょう
class Cat(Animal):
    def speak(self):
        return f"{self.name} meows"

    def purr(self):
        return f"{self.name} purrs"

cat = Cat("Whiskers")
print(cat.speak())
print(cat.purr())

