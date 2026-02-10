#!/bin/bash

# 03-practical ディレクトリ内のすべての演習をチェックするスクリプト

# スクリプトの場所を基準にディレクトリを決定
BASE_DIR=$(dirname "$0")
cd "$BASE_DIR" || exit

# チェック対象のディレクトリのリスト
EXERCISES=(
    "22-cli-argparse"
    "23-json-io"
    "24-http-requests"
    "25-regex-basic"
    "26-logging-basic"
    "27-venv-requirements"
    "28-sqlite-basic"
    "29-flask-mini"
    "30-final-mini-project"
)

# ログファイル
LOG_FILE="check_all.log"
# ログファイルを初期化
> "$LOG_FILE"

echo "Starting all checks for 03-practical..."
echo "Detailed logs will be written to $LOG_FILE"
echo "========================================"

all_passed=true

# 各演習ディレクトリでチェックを実行
for exercise in "${EXERCISES[@]}"; do
    echo -n "Checking ${exercise}... "
    
    if [ ! -d "$exercise" ]; then
        echo "SKIPPED (Directory not found)"
        continue
    fi

    # ディレクトリに移動
    cd "$exercise" || continue

    # --- 特別なセットアップが必要な演習の処理 ---

    # 24, 30: venv作成とrequestsインストール
    if [ "$exercise" == "24-http-requests" ] || [ "$exercise" == "30-final-mini-project" ]; then
        python3 -m venv venv >> "../$LOG_FILE" 2>&1
        (
            source venv/bin/activate
            pip install requests >> "../$LOG_FILE" 2>&1
            bash check.sh
        ) &> >(tee -a "../$LOG_FILE")
        result=$?
        rm -rf venv __pycache__

    # 27-venv-requirements: venv作成とrequestsインストール
    elif [ "$exercise" == "27-venv-requirements" ]; then
        python3 -m venv venv >> "../$LOG_FILE" 2>&1
        (
            source venv/bin/activate
            pip install requests >> "../$LOG_FILE" 2>&1
            pip freeze > requirements.txt
            bash check.sh
        ) &> >(tee -a "../$LOG_FILE")
        result=$?
        rm -rf venv requirements.txt __pycache__
    
    # 29-flask-mini: venv作成とFlaskインストール
    elif [ "$exercise" == "29-flask-mini" ]; then
        python3 -m venv venv >> "../$LOG_FILE" 2>&1
        (
            source venv/bin/activate
            pip install Flask >> "../$LOG_FILE" 2>&1
            bash check.sh
        ) &> >(tee -a "../$LOG_FILE")
        result=$?
        rm -rf venv __pycache__

    # その他の演習
    else
        bash check.sh &> >(tee -a "../$LOG_FILE")
        result=$?
    fi

    # --- 結果の判定 ---
    if [ $result -eq 0 ]; then
        echo "PASSED"
    else
        echo "FAILED"
        all_passed=false
    fi

    # 親ディレクトリに戻る
    cd ..
done

echo "========================================"
if $all_passed; then
    echo "🎉 All checks passed successfully!"
else
    echo "❌ Some checks failed. Please review the output above and in $LOG_FILE."
    exit 1
fi

# 成功した場合はログファイルを削除
if $all_passed; then
    rm "$LOG_FILE"
fi