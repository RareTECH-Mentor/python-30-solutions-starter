#!/bin/bash

# テストケース1: 問1の正常系
output1=$(echo "10" | python3 main.py | head -n 1)
expected1="入力された数値は10です"

if [[ "$output1" != *"$expected1"* ]]; then
  echo "不正解！よく問題を読んで再挑戦してください！ (Test Case 1 Failed)"
  exit 1
fi

# テストケース2: 問1の異常系
output2=$(echo "abc" | python3 main.py | head -n 1)
expected2="入力された値を整数に変換できません。整数を入力してください。"

if [[ "$output2" != *"$expected2"* ]]; then
  echo "不正解！よく問題を読んで再挑戦してください！ (Test Case 2 Failed)"
  exit 1
fi

# テストケース3: 問2のループ系
# 'abc' と '10' を順にパイプで渡す
output3=$(printf "abc\n10\n" | python3 main.py)
# 問2の部分の出力だけを抽出
output3_q2=$(echo "$output3" | tail -n 2)

expected3_line1="入力された値を整数に変換できません。整数を入力してください。"
expected3_line2="入力された数値は10です"

# 実際の出力を行ごとに配列に格納
IFS=$'\n' read -r -d '' -a lines <<< "$output3_q2"

if [[ "${lines[0]}" != *"$expected3_line1"* ]] || [[ "${lines[1]}" != *"$expected3_line2"* ]]; then
    echo "不正解！よく問題を読んで再挑戦してください！ (Test Case 3 Failed)"
    exit 1
fi


echo "正解！次の問題に進みましょう！"
