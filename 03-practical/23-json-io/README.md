# 23 - JSON IO（JSONの読み書き）

この章では、Pythonで**JSON（JavaScript Object Notation）** 形式のデータを扱う方法について学びます。
`json`モジュールは、PythonのオブジェクトをJSON文字列に変換したり、JSON文字列をPythonのオブジェクトに変換したりするための標準ライブラリです。

---

## Q1: PythonオブジェクトをJSONファイルに書き出す

この問題では、Pythonの辞書オブジェクトをJSONファイルに書き出す方法を学びます。

### 要件

- `main.py` に `data` という名前で以下の辞書オブジェクトを定義します。
  ```python
  data = {
      "name": "John Doe",
      "age": 30,
      "isStudent": False,
      "courses": [
          {"title": "History", "credits": 3},
          {"title": "Math", "credits": 4}
      ]
  }
  ```
- `json.dump()` を使って、`data` オブジェクトを `data.json` という名前のファイルに書き出します。
- 書き出す際、人間が読みやすいようにインデントを `4` に設定してください。
- ファイル書き出し後、`"data.json has been created."` という文字列を標準出力に表示してください。

---

## Q2: JSONファイルを読み込んでPythonオブジェクトに変換する

この問題では、JSONファイルを読み込み、その内容をPythonのオブジェクトに変換する方法を学びます。

### 要件

- Q1で作成した `data.json` ファイルを読み込みます。
- `json.load()` を使って、ファイルの内容をPythonの辞書オブジェクトに変換します。
- 変換したオブジェクトから `name` の値を取得し、`"Name: John Doe"` という形式で標準出力に表示してください。

---

## 変更するファイル

- `main.py`

---

## 正誤チェック方法

```bash
bash check.sh
```