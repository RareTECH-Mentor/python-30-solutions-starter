import argparse

def main():
    # ここに argparse を使った処理を記述してください
    # 1. ArgumentParserオブジェクトを作成
    parser = argparse.ArgumentParser(description="A simple CLI tool.")

    # 2. 引数を追加
    # 必須の位置引数 name
    parser.add_argument("name", type=str, help="The name to greet.")
    # オプション引数 --greet
    parser.add_argument("-g", "--greet", type=str, default="Hello", help="The greeting message.")

    # 3. 引数を解析
    args = parser.parse_args()

    # 4. 解析した引数を使って処理を実行
    print(f"{args.greet}, {args.name}!")


if __name__ == "__main__":
    main()
