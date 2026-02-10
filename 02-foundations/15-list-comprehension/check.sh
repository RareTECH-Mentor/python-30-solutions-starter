#!/bin/bash

# main.py を実行し、出力を変数に格納
output=$(python3 main.py)

# 各行の出力を配列に格納
IFS=$'\n' read -r -d '' -a lines <<< "$output"

# 期待される出力を定義
expected_outputs=(
  "問1: [2, 4, 6, 8, 10]"
  "問2: [2, 4, 6]"
  "問3: [5, 6, 6]"
  "問4: ['ALICE', 'BOB', 'CHARLIE']"
  "問5: [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]"
  "問6: ['NG', 'OK', 'NG', 'OK']"
)

# 各問の出力をチェック
for i in "${!expected_outputs[@]}"; do
  if [ "${lines[$i]}" != "${expected_outputs[$i]}" ]; then
    echo "不正解！よく問題を読んで再挑戦してください！ (問${i+1}が違います)"
    exit 1
  fi
done

echo "正解！次の問題に進みましょう！"
