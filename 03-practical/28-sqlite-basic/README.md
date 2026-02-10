# 28 - SQLite Basic（SQLiteデータベースの基礎）

この章では、Pythonの標準ライブラリ `sqlite3` を使って、**SQLiteデータベース**を操作する基本的な方法を学びます。
SQLiteは、サーバーを必要とせず、単一のファイルとしてデータベースを扱える手軽なリレーショナルデータベース管理システムです。

---

## Q1: データベースへの接続、テーブル作成、データの挿入と取得

この問題では、一連のデータベース操作を学びます。
1.  データベースファイルに接続する
2.  `employees` という名前のテーブルを作成する
3.  テーブルに2人の従業員データを挿入する
4.  挿入したデータを取得して表示する

### 要件

- `company.db` という名前のデータベースに接続します。（ファイルが存在しない場合は自動的に作成されます）
- `employees` テーブルを作成します。テーブルは以下のカラムを持ちます。
  - `id`: INTEGER, PRIMARY KEY
  - `name`: TEXT
  - `position`: TEXT
- `employees` テーブルに以下の2件のデータを挿入します。
  1.  `id=1`, `name='Alice'`, `position='Software Engineer'`
  2.  `id=2`, `name='Bob'`, `position='Project Manager'`
- `employees` テーブルから全ての従業員データを取得（SELECT）します。
- 取得したデータを1行ずつタプルの形式で標準出力に表示してください。
- 最後に、データベースへの接続を閉じてください。

### 期待される出力

```
(1, 'Alice', 'Software Engineer')
(2, 'Bob', 'Project Manager')
```

---

## 変更するファイル

- `main.py`

---

## 正誤チェック方法

```bash
bash check.sh
```
