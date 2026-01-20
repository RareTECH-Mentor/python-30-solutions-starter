#!/usr/bin/env bash
set -euo pipefail

EXPECTED=$(
cat << 'EOF'
Hello Python
Hello Python
Hello Python
Hello <name>：<name>は任意の値
Hello <name>：<name>は任意の値
EOF
)

OUT="$(python3 main.py)"
OUT="${OUT//$'\r'/}"

OK=true

# ループ（for/while）が1回以上あるか（問1用）
COUNT=$(grep -Eo '\b(for|while)\b' main.py | wc -l | tr -d ' ')
if [ "$COUNT" -lt 1 ]; then
  echo "... 不正解です！"
  echo "繰り返しには for文またはwhile文を使用してください"
  exit 1
fi

# チェック対象の関数名（問1〜問3）
FUNCTIONS=(
  print_hello_python
  say_hello
  format_name
)

for func in "${FUNCTIONS[@]}"; do
  # 関数が定義されているか
  grep -Eq "^\s*def\s+${func}\s*\(" main.py || {
    echo "... 不正解です！"
    echo "出力は関数を呼び出して実行してください"
    exit 1
  }

  # 関数が呼び出されているか（def 行は除外）
  grep -Ev '^\s*def\s+' main.py | grep -Eq "\b${func}\s*\(" || {
    echo "... 不正解です！"
    echo "出力は関数を呼び出して実行してください"
    exit 1
  }
done

# --- 問1：print_hello_python は関数内で print を使う ---

HELLO_BODY="$(
  awk '
    found {
      if ($0 ~ /^[[:space:]]*$/) next
      if ($0 ~ /^[[:space:]]+/) { print; next }
      exit
    }
    /^[[:space:]]*def[[:space:]]+print_hello_python[[:space:]]*\(/ { found=1; next }
  ' main.py
)"

# print_hello_python：関数内で print を使う／return を使わない
if ! echo "$HELLO_BODY" | grep -Eq '^[[:space:]]*print[[:space:]]*\('; then
  echo "... 不正解です！"
  echo "print_hello_python 関数の中で print を使って出力してください"
  exit 1
fi

if echo "$HELLO_BODY" | grep -Eq '^[[:space:]]*return[[:space:]]+'; then
  echo "... 不正解です！"
  echo "print_hello_python 関数の中では return を使わず、print で出力してください"
  exit 1
fi


# --- 問2：say_hello は関数内で print を使う（return の禁止） ---

SAY_BODY="$(
  awk '
    found {
      if ($0 ~ /^[[:space:]]*$/) next
      if ($0 ~ /^[[:space:]]+/) { print; next }
      exit
    }
    /^[[:space:]]*def[[:space:]]+say_hello[[:space:]]*\(/ { found=1; next }
  ' main.py
)"

if ! echo "$SAY_BODY" | grep -Eq '^[[:space:]]*print[[:space:]]*\('; then
  echo "... 不正解です！"
  echo "say_hello 関数の中で print を使って出力してください"
  exit 1
fi

if echo "$SAY_BODY" | grep -Eq '^[[:space:]]*return[[:space:]]+'; then
  echo "... 不正解です！"
  echo "say_hello 関数の中では return を使わず、print で出力してください"
  exit 1
fi



# --- 問3：format_name は return 必須 & 関数内 print 禁止 ---

# format_name の「関数本体（インデント行）」だけを抽出
FMT_BODY="$(
  awk '
    found {
      if ($0 ~ /^[[:space:]]*$/) next
      if ($0 ~ /^[[:space:]]+/) { print; next }
      exit
    }
    /^[[:space:]]*def[[:space:]]+format_name[[:space:]]*\(/ { found=1; next }
  ' main.py
)"

# return が関数本体にあるか
echo "$FMT_BODY" | grep -Eq '^[[:space:]]*return[[:space:]]+' || {
  echo "... 不正解です！"
  echo "format_name関数では return を使用してください"
  exit 1
}

# print が関数本体に無いか
echo "$FMT_BODY" | grep -Eq '^[[:space:]]*print[[:space:]]*\(' && {
  echo "... 不正解です！"
  echo "format_name関数の中で print を使わないでください"
  exit 1
}

LINE1=$(echo "$OUT" | sed -n '1p')
LINE2=$(echo "$OUT" | sed -n '2p')
LINE3=$(echo "$OUT" | sed -n '3p')
LINE4=$(echo "$OUT" | sed -n '4p')
LINE5=$(echo "$OUT" | sed -n '5p')
LINE6=$(echo "$OUT" | sed -n '6p')

# 行数チェック
[[ -z "$LINE6" ]] || OK=false

# 1〜3行目: Hello Python
[[ "$LINE1" == "Hello Python" ]] || OK=false
[[ "$LINE2" == "Hello Python" ]] || OK=false
[[ "$LINE3" == "Hello Python" ]] || OK=false

# 4行目: Hello <name>（空文字は不可）
if [[ "$LINE4" != Hello\ * ]]; then
  echo "... 不正解です！"
  echo "問２の引数に適切な名前を入力してください"
  exit 1
fi

# "Hello " 以降の部分を取り出す
NAME4="${LINE4#Hello }"

# 空白を全部消して空になるならNG（スペースだけ、タブだけ等を弾ける）
if [[ -z "${NAME4//[[:space:]]/}" ]]; then
  echo "... 不正解です！"
  echo "問２の引数に適切な名前を入力してください"
  exit 1
fi

# 5行目: Hello <name>（空文字は不可）
if [[ "$LINE5" != Hello\ * ]]; then
  echo "... 不正解です！"
  echo "問３の引数に適切な名前を入力してください"
  exit 1
fi

# "Hello " 以降の部分を取り出す
NAME5="${LINE5#Hello }"

# 空白を全部消して空になるならNG（スペースだけ、タブだけ等を弾ける）
if [[ -z "${NAME5//[[:space:]]/}" ]]; then
  echo "... 不正解です！"
  echo "問３の引数に適切な名前を入力してください"
  exit 1
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
