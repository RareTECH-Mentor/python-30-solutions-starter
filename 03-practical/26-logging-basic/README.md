# 26 - Logging Basic（ロギングの基礎）

この章では、Pythonの標準ライブラリ `logging` を使った**ロギング**の基本的な方法を学びます。
`print()` の代わりにロギングを使うことで、メッセージの重要度（レベル）に応じて出力を制御したり、出力先をコンソールからファイルに切り替えたりすることが柔軟にできます。

---

## Q1: 基本的なロギング設定とメッセージ出力

この問題では、`logging`モジュールを設定し、異なるレベルのログメッセージをコンソールに出力する方法を学びます。

### 要件

- `logging.basicConfig()` を使って、ロギングの基本設定を行います。
  - ログレベルを `INFO` に設定してください。これにより、`INFO` 以上のレベルのメッセージが表示されるようになります。
  - ログのフォーマットを `%(levelname)s:%(message)s` に設定してください。
- 設定後、以下の2つのログメッセージを出力してください。
  1. `INFO` レベルで `"Processing data..."` というメッセージ
  2. `WARNING` レベルで `"Something unexpected happened."` というメッセージ

### 期待される出力

```
INFO:Processing data...
WARNING:Something unexpected happened.
```

---

## 変更するファイル

- `main.py`

---

## 正誤チェック方法

```bash
bash check.sh
```
