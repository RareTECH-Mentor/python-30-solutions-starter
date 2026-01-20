#!/usr/bin/env bash
set -euo pipefail

AGE=20
EXPECTED_KAZOE=$((AGE + 1))

EXPECTED=$(
cat << EOF
年齢を入力してください：
あなたの数え年は${EXPECTED_KAZOE}歳です
EOF
)

OUT="$(
python3 main.py << EOF
$AGE
EOF
)"

# 改行コードゆれ対策（Windows CRLF対策）
OUT="${OUT//$'\r'/}"

LINE_COUNT=$(printf "%s\n" "$OUT" | wc -l | tr -d ' ')

OK=true

# プロンプトの後に半角スペースが入る可能性も許容
PROMPT_PREFIX="年齢を入力してください："
RESULT_LINE="あなたの数え年は${EXPECTED_KAZOE}歳です"

if [ "$LINE_COUNT" -ge 2 ]; then
  LINE1=$(printf "%s\n" "$OUT" | sed -n '1p')
  LINE2=$(printf "%s\n" "$OUT" | sed -n '2p')

  # 1行目はプロンプトだけ（末尾のスペースは許容）
  [[ "$LINE1" == "$PROMPT_PREFIX"* ]] || OK=false
  # 2行目は計算結果が正しいことを厳密にチェック
  [[ "$LINE2" == "$RESULT_LINE" ]] || OK=false
else
  # 1行出力の場合：プロンプト＋結果が同じ行に入っていればOK
  [[ "$OUT" == "$PROMPT_PREFIX"*"$RESULT_LINE"* ]] || OK=false
fi

if [ "$OK" = false ]; then
  echo "... 不正解です！"
  echo "expected:"
  echo "$EXPECTED"
  echo
  echo "actual:"
  echo "$OUT"
  exit 1
fi

echo "... 正解です！次の問題に進みましょう！"
