# Q01: String Split
# 文字列をsplit()メソッドで分割してみましょう
text = "apple,banana,orange"
fruits = text.split(",")
print(fruits)

# Q02: String Join
# リストをjoin()メソッドで結合してみましょう
words = ["Hello", "World", "Python"]
result = " ".join(words)
print(result)

# Q03: Split and Join
# 文字列を分割して、別の区切り文字で結合してみましょう
sentence = "one-two-three"
parts = sentence.split("-")
new_sentence = "_".join(parts)
print(new_sentence)
