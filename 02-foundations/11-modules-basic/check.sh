#!/bin/bash

# main.py を実行し、出力を変数に格納
output=$(python3 main.py)

# 各行の出力を配列に格納
IFS=$'\n' read -r -d '' -a lines <<< "$output"

# 問1のチェック
if [ "${lines[0]}" = "25の平方根は5.0です" ]; then
  :
else
  echo "不正解！よく問題を読んで再挑戦してください！"
  exit 1
fi

# 問2のチェック
if [ "${lines[1]}" = "円周率は3.141592653589793です" ]; then
  :
else
  echo "不正解！よく問題を読んで再挑戦してください！"
  exit 1
fi

# 問3のチェック
if [[ "${lines[2]}" =~ ^[1-6]$ ]]; then
  :
else
  echo "不正解！よく問題を読んで再挑戦してください！"
  exit 1
fi

# 問4のチェック
if [ "${lines[3]}" = "Hello Python!" ]; then
  :
else
  echo "不正解！よく問題を読んで再挑戦してください！"
  exit 1
fi

echo "正解！次の問題に進みましょう！"
