EXPECTED=$(
cat << 'EOF'
1行目: 名前を入力してください：Hello、<name>!
2行目: 年齢を入力してください: あなたの年齢は<age>歳です
EOF
)

OUT="$(
python3 main.py << 'EOF'
TESTNAME
99
EOF
)"

LINE1=$(echo "$OUT" | sed -n '1p')
LINE2=$(echo "$OUT" | sed -n '2p')

OK=true

[[ "$LINE1" == 名前を入力してください：Hello,*! ]] || OK=false
[[ "$LINE2" == 年齢を入力してください：あなたの年齢は*歳です ]] || OK=false

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
