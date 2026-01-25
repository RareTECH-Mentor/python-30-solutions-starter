## Q15: List Comprehension

この問題では、内包表記に関する問題を解いていきましょう。
内包表記とは、「for文でリストを作る処理を、1行で書く書き方のこと」です。

---

### 問１：数値を2倍しよう

次の for 文と同じ結果になるように、リスト内包表記で書き直してください。

```
original_numbers = [1, 2, 3, 4, 5]
doubled_numbers = []

for number in original_numbers:
    doubled_numbers.append(number * 2)
```

---

### 問２：偶数だけを取り出してみよう

次のコードを リスト内包表記で書き直してください。

```
mixed_numbers = [1, 2, 3, 4, 5, 6]
even_numbers = []

for number in mixed_numbers:
    if number % 2 == 0:
        even_numbers.append(number)
```

---

### 問３：文字列の長さをリストにしてみよう

文字列のリストがあります。

```
fruit_names = ["apple", "banana", "cherry"]
```

各単語の文字数を格納したリストを、
リスト内包表記で作成してください。

**期待する出力結果**

```
[5, 6, 6]
```

---

### 問４：大文字に変換してみよう

次の for 文を リスト内包表記で書き直してください。

```
lowercase_names = ["alice", "bob", "charlie"]
upper_names = []

for name in lowercase_names:
    upper_names.append(name.upper())
```

### 問５：0〜9 の平方数リストを作成しよう

`range()`を使って、
0〜9 の平方数のリストを内包表記で作成してください。

**期待する出力結果**

```
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

```

---

### 問６：条件付きで値を変えてみよう

次の条件で新しいリストを作成してください。

- 数値が 10以上 → "OK"
- 数値が 10未満 → "NG"

```
scores = [5, 12, 8, 20]
```

---

## 変更するファイル

- main.py

---

## 正誤チェック方法

```bash
python main.py
bash check.sh
```
