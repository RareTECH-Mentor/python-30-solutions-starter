import requests

# Q1: GETリクエストを送信してJSONデータを取得する

url = "https://jsonplaceholder.typicode.com/users/1"

try:
    response = requests.get(url)
    response.raise_for_status()  # ステータスコードが200番台でなければエラーを発生

    user_data = response.json()

    name = user_data.get("name")
    email = user_data.get("email")

    print(f"Name: {name}")
    print(f"Email: {email}")

except requests.exceptions.RequestException as e:
    print(f"An error occurred: {e}")
