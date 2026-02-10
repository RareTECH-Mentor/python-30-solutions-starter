import requests
import json

# APIから取得するユーザーID
USER_ID = 1
API_URL = f"https://jsonplaceholder.typicode.com/users/{USER_ID}/todos"

# 保存するファイル名
OUTPUT_FILE = "completed_todos.json"

def main():
    try:
        # 1. データを取得する
        response = requests.get(API_URL)
        response.raise_for_status()
        todos = response.json()

        # 2. データをフィルタリングする
        completed_todos = [
            todo for todo in todos if todo.get("completed")
        ]

        # 3. ファイルに保存する
        with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
            json.dump(completed_todos, f, indent=2)

        # 4. 結果を出力する
        num_completed = len(completed_todos)
        print(f"Successfully saved {num_completed} completed todos to {OUTPUT_FILE}.")

    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
    except IOError as e:
        print(f"Error writing to file: {e}")


if __name__ == "__main__":
    main()