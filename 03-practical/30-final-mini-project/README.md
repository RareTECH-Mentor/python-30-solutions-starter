# 30 - Final Mini Project（最終ミニプロジェクト）

おめでとうございます！これが最後の課題です。
このプロジェクトでは、これまでに学んだいくつかの重要なスキルを組み合わせて、簡単な実用的なツールを作成します。

- `requests` を使ったAPIからのデータ取得 (`24-http-requests`)
- `json` を使ったデータの処理とファイルへの保存 (`23-json-io`)
- 基本的なファイルI/O (`12-file-read-write`)

---

## プロジェクト概要: "完了済みTODOリスト" 保存ツール

指定されたユーザーのTODOリストをWeb APIから取得し、その中から「完了済み」のタスクだけをフィルタリングして、結果をJSONファイルに保存するコマンドラインツールを作成します。

---

## 要件

1.  **データを取得する**:
    -   `requests` ライブラリを使って、JSONPlaceholder API の以下のURLから、ユーザーID `1` のTODOリストを取得します。
    -   URL: `https://jsonplaceholder.typicode.com/users/1/todos`

2.  **データをフィルタリングする**:
    -   取得したTODOリスト（Pythonのリスト形式になっているはずです��をループ処理します。
    -   各TODOアイテム（辞書形式）の `completed` キーの値が `True` のものだけを新しいリストに集めます。

3.  **ファイルに保存する**:
    -   フィルタリングして集めた「完了済みのTODOリスト」を、`completed_todos.json` という名前のファイルに書き出します。
    -   `json.dump()` を使い、人間が読みやすいようにインデントを設定して保存してください。

4.  **結果を出力する**:
    -   ファイルへの保存が完了したら、`"Successfully saved X completed todos to completed_todos.json."` というメッセージを標準出力に表示してください。
    -   `X` の部分には、実際に保存した完了済みTODOの件数を入れてください。

---

## 準備

`requests` ライブラリが必要です。インストールされていない場合は、ターミナルで `pip install requests` を実行してください。

## 変更するファイル

- `main.py`

## 正誤チェック方法

```bash
bash check.sh
```
