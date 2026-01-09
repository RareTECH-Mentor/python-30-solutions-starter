#!/usr/bin/env bash
set -euo pipefail

EXPECTED="Hello Python!!"

OUT="$(python main.py)"

if [ "$OUT" != "$EXPECTED" ]; then
  echo "... 不正解です！"
  echo "expected: [$EXPECTED]"
  echo "actual  : [$OUT]"
  exit 1
fi

echo "... 正解です！次の問題に進みましょう！"
