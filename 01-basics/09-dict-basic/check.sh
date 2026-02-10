#!/bin/bash

# 期待される出力
expected="----------------
未達成の科目:
- Python
- CSS
- JavaScript
----------------
未達成の科目:
- JavaScript"

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