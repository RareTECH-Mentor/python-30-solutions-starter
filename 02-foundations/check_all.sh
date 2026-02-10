#!/bin/bash

# 02-foundations ディレクトリ内のすべての演習をチェックするスクリプト

# スクリプトの場所を基準にディレクトリを決定
BASE_DIR=$(dirname "$0")
cd "$BASE_DIR" || exit

# チェック対象のディレクトリのリスト
EXERCISES=(
    "11-modules-basic"
    "12-file-read-write"
    "13-exceptions-basic"
    "14-lambda-map-filter"
    "15-list-comprehension"
    "16-datetime-basic"
    "17-class-basic"
    "18-class-inheritance"
    "19-dataclass-basic"
    "20-typing-basic"
)

echo "Starting all checks for 02-foundations..."
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

    # check.sh を実行し、出力をキャプチャ
    output=$(bash check.sh 2>&1)
    result=$?

    # --- 結果��判定 ---
    if [ $result -eq 0 ]; then
        echo "PASSED"
    else
        echo "FAILED"
        # 失敗した場合のみ詳細を出力
        echo "--- Failure details for ${exercise} ---"
        echo "$output"
        echo "-------------------------------------------"
        all_passed=false
    fi

    # 親ディレクトリに戻る
    cd ..
done

echo "========================================"
if $all_passed; then
    echo "🎉 All checks for 02-foundations passed successfully!"
else
    echo "❌ Some checks failed. Please review the output above."
    exit 1
fi
