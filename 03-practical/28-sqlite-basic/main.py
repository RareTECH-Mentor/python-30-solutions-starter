import sqlite3
import os

db_name = 'company.db'

# 実行前にデータベースファイルが存在すれば削除しておく
if os.path.exists(db_name):
    os.remove(db_name)

# Q1: データベースに接続し、テーブルを作成してください。
# データベース名: company.db
# テーブル名: employees
# カラム:
#   - id: INTEGER, PRIMARY KEY
#   - name: TEXT, NOT NULL
#   - position: TEXT, NOT NULL
# ここにコードを書いてください


# Q2: テーブルにデータを挿入してください。
# 挿入するデータ:
#   - (1, 'Alice', 'Software Engineer')
#   - (2, 'Bob', 'Project Manager')
# executemany を使用してください。
# ここにコードを書いてください


# Q3: データを取得して表示してください。
# employees テーブルから全てのデータをid順で取得し、
# 各行をタプルのまま表示してください。
# ここにコードを書いてください


# Q4: データベース接続を閉じてください。
# ここにコードを書いてください
