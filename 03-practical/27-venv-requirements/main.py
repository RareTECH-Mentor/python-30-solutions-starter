# main.py
# このファイルを実行する前に、README.mdの指示に従って
# 仮想環境の作成、有効化、requestsのインストールを完了させてください。

import requests

# Q1: requestsライブラリを使ってAPIからデータを取得し、タイトルを表示する

url = "https://jsonplaceholder.typicode.com/todos/1"

try:
    response = requests.get(url)
    response.raise_for_status()
    todo_item = response.json()
    title = todo_item.get("title")
    print(f"Title: {title}")

except requests.exceptions.RequestException as e:
    print(f"An error occurred: {e}")
    print("Did you install the 'requests' library in your virtual environment?")

except ImportError:
    print("Error: 'requests' module not found.")
    print("Please activate your virtual environment and install it using 'pip install requests'.")