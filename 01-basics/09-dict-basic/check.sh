#!/usr/bin/env bash
set -euo pipefail

EXPECTED=$(
cat << 'EOF'
----------------
未達成の科目:
- Python
- CSS
- JavaScript
----------------
未達成の科目:
- JavaScript
EOF
)

OUT="$(python3 main.py)"
OUT="${OUT//$'\r'/}"

OK=true

# -------------------------------------------------
# 共通チェック
# -------------------------------------------------

# input禁止（03-basic-io不使用）
if grep -Eq '\binput\s*\(' main.py; then
  echo "... 不正解です！"
  echo "この問題では input() は使用できません"
  exit 1
fi

# for / while を最低1回
COUNT_LOOP=$(grep -Eo '\b(for|while)\b' main.py | wc -l | tr -d ' ')
if [ "$COUNT_LOOP" -lt 1 ]; then
  echo "... 不正解です！"
  echo "繰り返し処理（for / while）を使用してください"
  exit 1
fi

# if を最低1回
COUNT_IF=$(grep -Eo '\bif\b' main.py | wc -l | tr -d ' ')
if [ "$COUNT_IF" -lt 1 ]; then
  echo "... 不正解です！"
  echo "条件分岐（if）を使用してください"
  exit 1
fi

# -------------------------------------------------
# 関数定義・呼び出しチェック
# -------------------------------------------------

# 問2: print_unfinished()（引数なし）
grep -Eq '^[[:space:]]*def[[:space:]]+print_unfinished[[:space:]]*\(\s*\)[[:space:]]*:' main.py || {
  echo "... 不正解です！"
  echo "print_unfinished 関数は引数なしで定義してください（def print_unfinished():）"
  exit 1
}

# 問3: complete_subject(subject)（引数1つ）
grep -Eq '^[[:space:]]*def[[:space:]]+complete_subject[[:space:]]*\(\s*subject\s*\)[[:space:]]*:' main.py || {
  echo "... 不正解です！"
  echo "complete_subject 関数は subject を1つ受け取る形で定義してください（def complete_subject(subject):）"
  exit 1
}

# print_unfinished が呼ばれているか（def行除外）
CALL_PU=$(grep -Ev '^[[:space:]]*def[[:space:]]+' main.py | grep -Eo '\bprint_unfinished[[:space:]]*\(' | wc -l | tr -d ' ')
if [ "$CALL_PU" -lt 2 ]; then
  echo "... 不正解です！"
  echo "print_unfinished 関数を2回呼び出してください（更新前と更新後）"
  exit 1
fi

# complete_subject が呼ばれているか（def行除外）
CALL_CS=$(grep -Ev '^[[:space:]]*def[[:space:]]+' main.py | grep -Eo '\bcomplete_subject[[:space:]]*\(' | wc -l | tr -d ' ')
if [ "$CALL_CS" -lt 2 ]; then
  echo "... 不正解です！"
  echo "complete_subject 関数を呼び出してください（少なくとも2回）"
  exit 1
fi

# complete_subject("Python") と complete_subject("CSS") を呼んでいるか（順不同）
grep -Ev '^[[:space:]]*def[[:space:]]+' main.py | grep -Eq '\bcomplete_subject[[:space:]]*\([[:space:]]*["'\'']Python["'\''][[:space:]]*\)' || {
  echo "... 不正解です！"
  echo "complete_subject(\"Python\") を呼び出してください"
  exit 1
}

grep -Ev '^[[:space:]]*def[[:space:]]+' main.py | grep -Eq '\bcomplete_subject[[:space:]]*\([[:space:]]*["'\'']CSS["'\''][[:space:]]*\)' || {
  echo "... 不正解です！"
  echo "complete_subject(\"CSS\") を呼び出してください"
  exit 1
}

# -------------------------------------------------
# 問2: print_unfinished は print 専用（return禁止）
# -------------------------------------------------

UNFIN_BODY="$(
awk '
  found {
    if ($0 ~ /^[[:space:]]*$/) next
    if ($0 ~ /^[[:space:]]+/) { print; next }
    exit
  }
  /^[[:space:]]*def[[:space:]]+print_unfinished[[:space:]]*\(/ { found=1; next }
' main.py
)"

# print を使用しているか
if ! echo "$UNFIN_BODY" | grep -Eq '^[[:space:]]*print[[:space:]]*\('; then
  echo "... 不正解です！"
  echo "print_unfinished 関数内で print を使用してください"
  exit 1
fi

# return を使っていないか
if echo "$UNFIN_BODY" | grep -Eq '^[[:space:]]*return\b'; then
  echo "... 不正解です！"
  echo "print_unfinished 関数では return を使用しないでください"
  exit 1
fi

# -------------------------------------------------
# 問3: complete_subject は辞書を更新（print禁止・return不要）
# -------------------------------------------------

CS_BODY="$(
awk '
  found {
    if ($0 ~ /^[[:space:]]*$/) next
    if ($0 ~ /^[[:space:]]+/) { print; next }
    exit
  }
  /^[[:space:]]*def[[:space:]]+complete_subject[[:space:]]*\(/ { found=1; next }
' main.py
)"

# print を関数内で使っていないか（更新だけに集中）
if echo "$CS_BODY" | grep -Eq '^[[:space:]]*print[[:space:]]*\('; then
  echo "... 不正解です！"
  echo "complete_subject 関数の中で print を使わないでください（更新処理のみ）"
  exit 1
fi

# -------------------------------------------------
# 出力チェック（問2 → 問4）
# -------------------------------------------------

if [[ "$OUT" != "$EXPECTED" ]]; then
  OK=false
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
