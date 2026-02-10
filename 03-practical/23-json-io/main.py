import json

# Q1: PythonオブジェクトをJSONファイルに書き出す
data = {
    "name": "John Doe",
    "age": 30,
    "isStudent": False,
    "courses": [
        {"title": "History", "credits": 3},
        {"title": "Math", "credits": 4}
    ]
}

with open('data.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, indent=4)

print("data.json has been created.")

# Q2: JSONファイルを読み込んでPythonオブジェクトに変換する
with open('data.json', 'r', encoding='utf-8') as f:
    loaded_data = json.load(f)

name = loaded_data.get("name")
print(f"Name: {name}")
