#!/bin/bash

# 仮想環境が有効になっているか簡易的にチェック
if [ -z "$VIRTUAL_ENV" ]; then
    echo "エラー: 仮想環境が有効になっていません。"
    echo "このディレクトリで 'source venv/bin/activate' を実行してから、再度check.shを実行してください。"
    exit 1
fi

echo "仮想環境のチェックOK。"

# --- main.py の実行チェック ---
echo "main.py を実行します..."
output=$(python3 main.py)
expected_output="Title: delectus aut autem"

if [ "$output" != "$expected_output" ]; then
  echo "不正解！ main.py の出力が期待と異なります。"
  echo "Expected: $expected_output"
  echo "Actual:   $output"
  exit 1
fi
echo "main.py の出力OK。"

# --- requirements.txt のチェック ---
if [ ! -f "requirements.txt" ]; then
  echo "不正解！ requirements.txt ファイルが見つかりません。"
  echo "'pip freeze > requirements.txt' を実行しましたか？"
  exit 1
fi
echo "requirements.txt の存在OK。"

# requirements.txt に requests が含まれているかチェック (大文字小文字を区別しない)
if ! grep -i -q "requests" "requirements.txt"; then
  echo "不正解！ requirements.txt に 'requests' が含まれていません。"
  exit 1
fi
echo "requirements.txt の内容OK。"


echo "全てのチェックをクリアしました。正解です！"
