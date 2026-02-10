#!/bin/bash

# main.py を実行して出力を取得
output=$(python3 main.py)

# 期待される出力を定義 (ヒアドキュメントを使用)
expected_output=$(cat <<EOF
john.doe@example.com
jane.smith@example.org
info@company.co.uk
EOF
)

# 出力が期待通りかチェック
# sed '/^$/d' で空行を削除してから比較
if [ "$(echo "$output" | sed '/^$/d')" != "$expected_output" ]; then
  echo "不正解！ 出力が期待と異なります。"
  echo "--- Expected ---"
  echo "$expected_output"
  echo "--- Actual ---"
  echo "$output"
  echo "----------------"
  exit 1
fi

echo "正解です！よくできました！"