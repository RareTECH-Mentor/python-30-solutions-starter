# 問１：「Hello Python」を３回表示する関数
def print_hello_python():
    # 以下に関数内処理を記述してください
    for _ in range(3):
        print("Hello Python")

# 関数を実行してください
print_hello_python()


### 問２：引数を受け取って表示する関数
def say_hello(name):
    # 以下に関数内処理を記述してください
    print(f"Hello {name}")

# 関数を実行してください
say_hello("Alice")


# 問３：戻り値のある関数
def format_name(name):
    # 以下に関数内処理を記述してください
    return f"Hello {name}"

# 関数を実行してください
text = format_name("太郎")
print(text)