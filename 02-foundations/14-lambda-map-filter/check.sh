#!/bin/bash

# main.py を実行して出力を取得
output=$(python3 main.py)

# 期待される出力を定義
expected_q1="[1, 4, 9, 16, 25]"
expected_q2="[2, 4, 6, 8, 10]"

# 実際の出力の1行目と2行目を取得
actual_q1=$(echo "$output" | sed -n '1p')
actual_q2=$(echo "$output" | sed -n '2p')

# --- Q1のチェック ---
if [ "$actual_q1" != "$expected_q1" ]; then
  echo "不正解！ Q1の出力が期待と異なります。"
  echo "Expected: $expected_q1"
  echo "Actual:   $actual_q1"
  exit 1
fi

# --- Q2のチェック ---
if [ "$actual_q2" != "$expected_q2" ]; then
  echo "不正解！ Q2の出力が期待と異なります。"
  echo "Expected: $expected_q2"
  echo "Actual:   $actual_q2"
  exit 1
fi

echo "正解です！よくできました！"
