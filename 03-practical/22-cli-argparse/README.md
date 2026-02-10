## Q22: CLI Argparse

この問題では、コマンドライン引数を扱うための標準ライブラリ `argparse` の基本的な使い方を学びます。
`argparse` を使うと、コマンドラインからプログラムに情報を渡すことができ、本格的なCLIツールを作成できます。

---

## 要件

`argparse` を使って、以下の要件を満たすコマンドラインツールを作成してください。

1.  必須の位置引数 `name` を受け取ること。
2.  オプション引数 `--greet` (短縮形: `-g`) を受け取ること。
    -   `--greet` のデフォルト値は `Hello` とすること。
3.  プログラムを実行すると、以下の形式で文字列を出力すること。
    -   `[greetの値], [nameの値]!`

---

## 実行例

```bash
# 位置引数のみを指定した場合
python main.py World
# 出力: Hello, World!

# 位置引数とオプション引数を指定した場合
python main.py World --greet "Hi"
# 出力: Hi, World!

# 短縮形のオプション引数を指定した場合
python main.py World -g "Hi"
# 出力: Hi, World!
```

---

## 変更するファイル

- `main.py`

---

## 正誤チェック方法

```bash
bash check.sh
```
