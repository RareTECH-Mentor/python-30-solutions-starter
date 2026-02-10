#!/bin/bash

# main.py を実行して出力を取得
output=$(python3 main.py)

# --- Q1のチェック ---

# data.json ファイルが存在するか確認
if [ ! -f "data.json" ]; then
  echo "不正解！ data.json ファイルが作成されていません。"
  exit 1
fi

# Q1の期待される出力を定義
expected_q1_output="data.json has been created."
# main.py の出力の1行目を取得
actual_q1_output=$(echo "$output" | sed -n '1p')

if [ "$actual_q1_output" != "$expected_q1_output" ]; then
  echo "不正解！ Q1の出力が期待と異なります。"
  echo "Expected: $expected_q1_output"
  echo "Actual:   $actual_q1_output"
  rm data.json
  exit 1
fi

# --- Q2のチェック ---

# Q2の期待される出力を定義
expected_q2_output="Name: John Doe"
# main.py の出力の2行目を取得
actual_q2_output=$(echo "$output" | sed -n '2p')

if [ "$actual_q2_output" != "$expected_q2_output" ]; then
  echo "不正解！ Q2の出力が期待と異なります。"
  echo "Expected: $expected_q2_output"
  echo "Actual:   $actual_q2_output"
  rm data.json
  exit 1
fi

# --- ファイル内容のチェック ---
# jqコマンドが使える場合は、より厳密なチェックが可能
if command -v jq &> /dev/null; then
    name=$(jq -r '.name' data.json)
    if [ "$name" != "John Doe" ]; then
        echo "不正解！ data.json の内容が正しくありません。"
        rm data.json
        exit 1
    fi
else
    # jqがない場合は簡易的なgrepでチェック
    if ! grep -q '"name": "John Doe"' data.json; then
        echo "不正解！ data.json の内容が正しくありません。"
        rm data.json
        exit 1
    fi
fi


echo "正解です！よくできました！"

# チェック用の後片付け
rm data.json