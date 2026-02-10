import json

# Q1: PythonオブジェクトをJSONファイルに書き出す
# `data` ディクショナリを `data.json` という名前のファイルにJSON形式で書き出してください。
# インデントを4スペースに設定してください。
data = {
    "name": "John Doe",
    "age": 30,
    "isStudent": False,
    "courses": [
        {"title": "History", "credits": 3},
        {"title": "Math", "credits": 4}
    ]
}
# ここにコードを書いてください


# Q2: JSONファイルを読み込んでPythonオブジェクトに変換する
# `data.json` ファイルを読み込み、内容をPythonオブジェクトに変換してください。
# そのオブジェクトから "name" の値を抽出し、"Name: ..." の形式で表示してください。
# ここにコードを書いてください