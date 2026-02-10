#!/bin/bash

# 事前にファイルがあれば削除
rm -f completed_todos.json

# main.py を実行
output=$(python3 main.py)

# --- ファイルの存在チェック ---
if [ ! -f "completed_todos.json" ]; then
  echo "不正解！ completed_todos.json ファイルが作成されていません。"
  exit 1
fi
echo "ファイルの存在チェックOK。"

# --- 出力のチェック ---
# APIから取得できる完了済みタスクの件数は11件
expected_count=11
expected_output="Successfully saved ${expected_count} completed todos to completed_todos.json."

if [ "$output" != "$expected_output" ]; then
  echo "不正解！ main.py の出力が期待と異なります。"
  echo "Expected: $expected_output"
  echo "Actual:   $output"
  rm -f completed_todos.json
  exit 1
fi
echo "出力のチェックOK。"

# --- JSONファイル内容のチェック ---
# jqコマンドでJSONファイル内の配列の要素数を数える
if command -v jq &> /dev/null; then
    count=$(jq 'length' completed_todos.json)
    if [ "$count" -ne "$expected_count" ]; then
        echo "不正解！ JSONファイルに保存されたTODOの件数が正しくありません。"
        echo "Expected count: $expected_count"
        echo "Actual count:   $count"
        rm -f completed_todos.json
        exit 1
    fi
    echo "JSONの件数チェックOK。"

    # completedが全てtrueかチェック
    all_completed=$(jq 'map(.completed) | all' completed_todos.json)
     if [ "$all_completed" != "true" ]; then
        echo "不正解！ JSONファイルに未完了のTODOが含まれています。"
        rm -f completed_todos.json
        exit 1
    fi
    echo "JSONの内容チェックOK。"
else
    echo "警告: jqコマンドが見つかりません。JSON内容の厳密なチェックをスキップします。"
fi


echo "全てのチェックをクリアしました。正解です！素晴らしい！"

# 後片付け
rm -f completed_todos.json
