import requests
import json

# APIから取得するユーザーID
USER_ID = 1
API_URL = f"https://jsonplaceholder.typicode.com/users/{USER_ID}/todos"

# 保存するファイル名
OUTPUT_FILE = "completed_todos.json"

def main():
    # このミニプロジェクトでは、以下の処理を実装します。
    # 1. APIからデータを取得する
    #    - `API_URL` に対してGETリクエストを送信し、ToDoリストを取得します。
    # 2. データをフィルタリングする
    #    - 取得したToDoリストの中から、"completed" が true のものだけを抽出します。
    # 3. ファイルに保存する
    #    - 抽出した完了済みのToDoリストを、`OUTPUT_FILE` にJSON形式で保存します。
    #      （インデントは2スペースに設定）
    # 4. 結果を出力する
    #    - "Successfully saved {完了したToDoの数} completed todos to {出力ファイル名}."
    #      というメッセージを表示します。
    #
    # APIリクエストやファイル書き込みでエラーが発生した場合の例外処理も実装してください。
    # ここにコードを書いてください
    pass


if __name__ == "__main__":
    main()
