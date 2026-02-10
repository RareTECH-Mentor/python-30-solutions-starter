import sqlite3
import os

db_name = 'company.db'

# 実行前にデータベースファイルが存在すれば削除しておく
if os.path.exists(db_name):
    os.remove(db_name)

conn = sqlite3.connect(db_name)
cursor = conn.cursor()

# テーブル作成
cursor.execute('''
CREATE TABLE IF NOT EXISTS employees (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT NOT NULL
)
''')

# データ挿入
employees_to_add = [
    (1, 'Alice', 'Software Engineer'),
    (2, 'Bob', 'Project Manager')
]
cursor.executemany('INSERT INTO employees (id, name, position) VALUES (?, ?, ?)', employees_to_add)

conn.commit()

# データ取得
cursor.execute('SELECT * FROM employees ORDER BY id')
all_employees = cursor.fetchall()

for row in all_employees:
    print(row)

conn.close()