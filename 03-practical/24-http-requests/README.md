# 24 - HTTP Requests（HTTPリクエスト）

この章では、Pythonで**HTTPリクエスト**を送信する方法について学びます。
サードパーティ製の `requests` ライブラリは、PythonでHTTP通信を行う際のデファクトスタンダードとなっています。

---

## 準備

この問題を解くには `requests` ライブラリが必要です。
ターミナルで以下のコマンドを実行して、ライブラリをインストールしてください。

```bash
pip install requests
```

---

## Q1: GETリクエストを送信してJSONデータを取得する

この問題では、指定されたURLにGETリクエストを送信し、レスポンスとして得られるJSONデータから特定の情報を抽出する方法を学びます。

### 要件

- `requests.get()` を使って、以下のURLにGETリクエストを送信します。
  `https://jsonplaceholder.typicode.com/users/1`
- レスポンスが成功したか（ステータスコードが200番台か）を確認します。
- レスポンスボディをJSON形式でパースし、Pythonの辞書オブジェクトに変換します。
- 変換したオブジェクトから `name` と `email` の値を取得し、以下の形式で標準出力に表示してください。
  ```
  Name: Leanne Graham
  Email: Sincere@april.biz
  ```

---

## 変更するファイル

- `main.py`

---

## 正誤チェック方法

```bash
bash check.sh
```
