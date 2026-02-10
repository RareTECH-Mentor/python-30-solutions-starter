#!/bin/bash

# check.sh があるディレクトリを基準に main.py を実行
SCRIPT_DIR=$(dirname "$0")

# テストケース1: 位置引数のみ
expected1="Hello, World!"
actual1=$(python3 "${SCRIPT_DIR}/main.py" World)

if [ "$actual1" != "$expected1" ]; then
  echo "テストケース1が失敗しました。"
  echo "実行コマンド: python3 main.py World"
  echo "期待する出力: $expected1"
  echo "実際の出力:   $actual1"
  exit 1
fi

# テストケース2: 位置引数とオプション引数
expected2="Hi, Python!"
actual2=$(python3 "${SCRIPT_DIR}/main.py" Python --greet "Hi")

if [ "$actual2" != "$expected2" ]; then
  echo "テストケース2が失敗しました。"
  echo "実行コマンド: python3 main.py Python --greet \"Hi\""
  echo "期待する出力: $expected2"
  echo "実際の出力:   $actual2"
  exit 1
fi

# テストケース3: 短縮形のオプション引数
expected3="Good morning, CLI!"
actual3=$(python3 "${SCRIPT_DIR}/main.py" CLI -g "Good morning")

if [ "$actual3" != "$expected3" ]; then
  echo "テストケース3が失敗しました。"
  echo "実行コマンド: python3 main.py CLI -g \"Good morning\""
  echo "期待する出力: $expected3"
  echo "実際の出力:   $actual3"
  exit 1
fi

echo "OK！全てのテストケースをクリアしました！次の問題に進みましょう！"