# 25 - Regex Basic（正規表現の基礎）

この章では、Pythonの `re` モジュールを使った**正規表現**の基本的な使い方を学びます。
正規表現は、特定のパターンを持つ文字列を検索、置換、抽出するための強力なツールです。

---

## Q1: 文字列からEメールアドレスを抽出する

この問題では、与えられたテキストの中から、正規表現を使って全てのEメールアドレスを抽出します。

### 要件

- `main.py` に `text` という名前で以下の複数行文字列を定義します。
  ```python
  text = """
  Contact list:
  John Doe's email is john.doe@example.com.
  Jane Smith can be reached at jane.smith@example.org.
  For inquiries, please contact info@company.co.uk.
  Invalid email: user@.com or @domain.com
  """
  ```
- `re.findall()` を使って、`text` の中からEメールアドレスのパターンに一致する全ての文字列をリストとして抽出します。
- 抽出したEメールアドレスのリストを、1行に1つずつ標準出力に表示してください。

### ヒント

- 一般的なEメールアドレスの正規表現パターンは `[\\w\\.-]+@[\\w\\.-]+` のような形になりますが、より正確なパターンを考えてみましょう。
- `\\w` は英数字とアンダースコアにマッチします。

### 期待される出力

```
john.doe@example.com
jane.smith@example.org
info@company.co.uk
```

---

## 変更するファイル

- `main.py`

---

## 正誤チェック方法

```bash
bash check.sh
```