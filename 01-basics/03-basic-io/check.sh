#!/bin/bash

# 入力する値
input_name="Alice"
input_age="20"

# 期待される出力
expected=$(printf "名前を入力してください：Hello, %s!\n年齢を入力してください：あなたの年齢は%s歳です\n" "$input_name" "$input_age")

# main.py を実行して実際に出力を取得
actual=$(printf "%s\n%s\n" "$input_name" "$input_age" | python3 main.py)

# 期待される出力と実際の出力を比較
if [ "$actual" = "$expected" ]; then
  echo "OK！次の問題に進みましょう！"
else
  echo "不正解！よく問題を読んで再度挑戦してください！"
  echo "Expected:"
  echo "$expected"
  echo "Actual:"
  echo "$actual"
  exit 1
fi