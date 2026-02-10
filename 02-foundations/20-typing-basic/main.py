# Q01: Type Hints for Variables
# 変数に型ヒントを付けてみましょう
from typing import List
name: str = "Alice"
age: int = 20
print(f"{name} is {age} years old")

# Q02: Type Hints for Functions
# 関数に型ヒントを付けてみましょう
def add(a: int, b: int) -> int:
    return a + b

result = add(5, 3)
print(result)

# Q03: Type Hints for Lists
# リストに型ヒントを付けてみましょう
from typing import List
numbers: List[int] = [1, 2, 3, 4, 5]
total = sum(numbers)
print(total)

