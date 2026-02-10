#!/bin/bash

# Flaskがインストールされているか確認
if ! python3 -c "import flask" &> /dev/null; then
    echo "エラー: Flaskがインストールされていません。"
    echo "'pip install Flask' を実行してください。"
    exit 1
fi

# curlがインストールされているか確認
if ! command -v curl &> /dev/null; then
    echo "エラー: curlコマンドが見つかりません。チェックにはcurlが必要です。"
    exit 1
fi

# Flaskアプリケーションをバックグラウンドで起動
export FLASK_APP=main.py
flask run &> /dev/null &
# プロセスIDを保存
PID=$!

# サーバーが起動するのを少し待つ
sleep 2

# --- テスト実行 ---
success=true

# ルートURLのテスト
echo "Testing http://127.0.0.1:5000/ ..."
response_root=$(curl -s http://127.0.0.1:5000/)
expected_root="Hello, Flask!"
if [ "$response_root" != "$expected_root" ]; then
    echo "不正解！ '/' のレスポンスが異なります。"
    echo "Expected: $expected_root"
    echo "Actual:   $response_root"
    success=false
fi

# /about URLのテスト
echo "Testing http://127.0.0.1:5000/about ..."
response_about=$(curl -s http://127.0.0.1:5000/about)
expected_about="This is the about page."
if [ "$response_about" != "$expected_about" ]; then
    echo "不正解！ '/about' のレスポンスが異なります。"
    echo "Expected: $expected_about"
    echo "Actual:   $response_about"
    success=false
fi

# --- 後片付け ---
# Flaskサーバーを停止
kill $PID
# プロセスが終了するのを待つ
wait $PID 2>/dev/null

# --- 最終結果 ---
if $success; then
    echo "全てのテストをクリアしました。正解です！"
else
    exit 1
fi
