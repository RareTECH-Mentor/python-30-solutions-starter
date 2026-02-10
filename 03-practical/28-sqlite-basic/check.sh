#!/bin/bash

# 事前にデータベースファイルがあれば削除
rm -f company.db

# main.py を実行
output=$(python3 main.py)

# --- 出力のチェック ---
expected_output=$(cat <<EOF
(1, 'Alice', 'Software Engineer')
(2, 'Bob', 'Project Manager')
EOF
)

if [ "$(echo "$output" | sed '/^$/d')" != "$expected_output" ]; then
  echo "不正解！ main.py の出力が期待と異なります。"
  echo "--- Expected ---"
  echo "$expected_output"
  echo "--- Actual ---"
  echo "$output"
  echo "----------------"
  # 後片付け
  rm -f company.db
  exit 1
fi
echo "出力のチェックOK。"

# --- データベースファイルのチェック ---
if [ ! -f "company.db" ]; then
  echo "不正解！ company.db ファイルが作成されていません。"
  exit 1
fi
echo "データベースファイルの存在チェックOK。"

# --- データベース内容のチェック ---
# sqlite3 コマンドで内容を直接確認
db_output=$(sqlite3 company.db "SELECT * FROM employees ORDER BY id;")
expected_db_output=$(cat <<EOF
1|Alice|Software Engineer
2|Bob|Project Manager
EOF
)

if [ "$db_output" != "$expected_db_output" ]; then
    echo "��正解！ データベースに保存されている内容が正しくありません。"
    echo "--- Expected DB Content ---"
    echo "$expected_db_output"
    echo "--- Actual DB Content ---"
    echo "$db_output"
    echo "---------------------------"
    # 後片付け
    rm -f company.db
    exit 1
fi
echo "データベースの内容チェックOK。"


echo "全てのチェックをクリアしました。正解です！"

# 後片付け
rm -f company.db
