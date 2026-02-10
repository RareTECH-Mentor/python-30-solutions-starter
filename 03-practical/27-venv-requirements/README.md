# 27 - Venv & Requirements（仮想環境と依存関係ファイル）

この章では、Pythonプロジェクトの**仮想環境**と**依存関係の管理**について学びます。

- **仮想環境 (`venv`)**: プロジェクトごとに独立したPython環境を作成する仕組みです。これにより、プロジェクトAで必要なライブラリのバージョンと、プロジェクトBで必要なバージョンが異なっていても、互いに影響を与えることなく開発を進められます。
- **`requirements.txt`**: プロジェクトが必要とする外部ライブラリとそのバージョンをリストアップしたファイルです。このファイルを使うことで、他の開発者があなたのプロジェクトをセットアップする際に、`pip install -r requirements.txt` というコマンド一つで同じ環境を簡単に再現できます。

---

## この演習の流れ

この演習は、`main.py`を編集するだけでなく、ターミナルでのコマンド操作が中心となります。

1.  **仮想環境の作成と有効化**
2.  **ライブラリのインストール**
3.  **ライブラリを使ったコードの記述**
4.  **`requirements.txt` の作成**

---

## Q1: 仮想環境のセットアップとライブラリの利用

### 要件

1.  まず、このディレクトリ (`27-venv-requirements`) 内に仮想環境を作成します。ターミナルで以下のコマンドを実行してください。
    ```bash
    python3 -m venv venv
    ```
    （`venv` という名前のディレクトリが作成されます）

2.  作成した仮想環境を有効化（アクティベート）します。
    ```bash
    source venv/bin/activate
    ```
    （ターミナルのプロンプトの先頭に `(venv)` と表示されれば成功です）

3.  `requests` ライブラリをインストールします。
    ```bash
    pip install requests
    ```

4.  `main.py` を編集し、`requests` を使って `https://jsonplaceholder.typicode.com/todos/1` からデータを取得し、そのTODOアイテムの `title` を表示するコードを書いてください。

5.  最後に、現在の環境にインストールされているライブラリを `requirements.txt` ファイルに書き出します。
    ```bash
    pip freeze > requirements.txt
    ```

### `main.py` の期待される出力

```
Title: delectus aut autem
```

---

## 変更・作成するファイル

- `main.py`
- `requirements.txt` （コマンドで自動生成）

---

## 正誤チェック方法

```bash
bash check.sh
```
（`check.sh` を実行する前に、必ず `source venv/bin/activate` で仮想環境を有効化しておいてください）
