#!/usr/bin/env bash
set -euo pipefail

EXPECTED=$(
cat << 'EOF'
1：Hello Python
2：Hello Python
3：Hello Python
4：Hello Python
5：Hello Python
EOF
)

OUT="$(python3 main.py)"
OUT="${OUT//$'\r'/}"

OK=true

if ! grep -q "for " main.py; then
  echo "... 不正解です！"
  echo "for文を使用してください"
  exit 1
fi

LINE1=$(echo "$OUT" | sed -n '1p')
LINE2=$(echo "$OUT" | sed -n '2p')
LINE3=$(echo "$OUT" | sed -n '3p')
LINE4=$(echo "$OUT" | sed -n '4p')
LINE5=$(echo "$OUT" | sed -n '5p')
LINE6=$(echo "$OUT" | sed -n '6p')

[[ -z "$LINE6" ]] || OK=false
[[ "$LINE1" == "1：Hello Python" ]] || OK=false
[[ "$LINE2" == "2：Hello Python" ]] || OK=false
[[ "$LINE3" == "3：Hello Python" ]] || OK=false
[[ "$LINE4" == "4：Hello Python" ]] || OK=false
[[ "$LINE5" == "5：Hello Python" ]] || OK=false

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
