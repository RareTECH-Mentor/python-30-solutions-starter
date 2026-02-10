#!/bin/bash

# main.py を実行して出力を取得
output=$(python3 main.py)

# 期待される出力を定義
expected_name="Name: Leanne Graham"
expected_email="Email: Sincere@april.biz"

# 実際の出力の1行目と2行目を取得
actual_name=$(echo "$output" | sed -n '1p')
actual_email=$(echo "$output" | sed -n '2p')

# 出力が期待通りかチェック
if [ "$actual_name" != "$expected_name" ] || [ "$actual_email" != "$expected_email" ]; then
  echo "不正解！ 出力が期待と異なります。"
  echo "Expected Name:  $expected_name"
  echo "Actual Name:    $actual_name"
  echo "Expected Email: $expected_email"
  echo "Actual Email:   $actual_email"
  exit 1
fi

echo "正解です！よくできました！"