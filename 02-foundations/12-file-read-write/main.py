# Q01: File Write
# ファイルに文字列を書き込んでみましょう
with open("output.txt", "w", encoding="utf-8") as f:
    f.write("Hello, Python!")

# Q02: File Read
# ファイルから内容を読み込んでみましょう
with open("output.txt", "r", encoding="utf-8") as f:
    content = f.read()
    print(content)

# Q03: File Append
# ファイルに追記してみましょう
with open("output.txt", "a", encoding="utf-8") as f:
    f.write("\nThis is a new line.")
with open("output.txt", "r", encoding="utf-8") as f:
    content = f.read()
    print(content)

