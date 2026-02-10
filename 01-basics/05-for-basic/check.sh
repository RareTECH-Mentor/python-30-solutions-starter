#!/bin/bash

# 期待される出力
expected="1：Hello Python
2：Hello Python
3：Hello Python
4：Hello Python
5：Hello Python"

# main.py を実行して実際に出力を取得
actual=$(python3 main.py)

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