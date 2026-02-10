#!/bin/bash

# main.py を実行し、出力を変数に格納
output=$(python3 main.py)

# 各行の出力を配列に格納
IFS=$'\n' read -r -d '' -a lines <<< "$output"

# 期待される出力を定義
expected_outputs=(
  "Person(name='Alice', age=20)"
  "名前：Bob"
  "年齢：35"
  "Book(title='Python入門', price=0)"
  "Book(title='JavaScript基礎', price=1300)"
  "800"
)

# 各行の出力をチェック
for i in "${!expected_outputs[@]}"; do
  if [ "${lines[$i]}" != "${expected_outputs[$i]}" ]; then
    echo "不正解！よく問題を読んで再挑戦してください！ (出力が異なります)"
    exit 1
  fi
done

echo "正解！次の問題に進みましょう！"
