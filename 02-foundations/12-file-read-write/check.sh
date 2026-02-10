#!/bin/bash

# main.py を実行し、出力を変数に格納
output=$(python3 main.py)

# 期待される出力を定義
expected_output_q2="Hello, Python!"
expected_output_q3="Hello, Python!
This is a new line."

# main.py の出力を確認
IFS=$'\n' read -r -d '' -a lines <<< "$output"

if [ "${lines[0]}" != "$expected_output_q2" ]; then
  echo "不正解！よく問題を読んで再挑戦してください！"
  exit 1
fi

# 2行目以降を結合してQ3の出力を再構築
output_q3=$(printf "%s\n" "${lines[@]:1}")
# 末尾の改行を削除
output_q3=${output_q3%$'\n'}


if [ "$output_q3" != "$expected_output_q3" ]; then
  echo "不正解！よく問題を読んで再挑戦してください！"
  exit 1
fi

# output.txt の内容を確認
file_content=$(cat output.txt)
if [ "$file_content" != "$expected_output_q3" ]; then
  echo "不正解！よく問題を読んで再挑戦してください！"
  exit 1
fi

echo "正解！次の問題に進みましょう！"
