# 問１の辞書型データを以下に定義してください。
progress = {
    "Python": False,
    "HTML": True,
    "CSS": False,
    "JavaScript": False
}


# 問２
# 2-1. 未達成の科目（value が Falseのもの）だけを表示する関数の定義。
def print_unfinished():
    # 以下に書かれている print("----------------") や print("未達成の科目:") は 消さないこと
    print("----------------")
    print("未達成の科目:")
    # 以下に関数内で行う処理を書いてください。
    # ヒント：辞書をループする方法について調べましょう！
    for subject, done in progress.items():
        if done is False:
            print(f"- {subject}")


# 2-2. print_unfinished関数を実行するコードを以下に記述してください。
print_unfinished()


# 問３
# 3-1. 未達成の科目を達成済みに変更する関数の定義。
def complete_subject(subject):
    # 以下に関数内で行う処理を書いてください。
    # 関数内で print() や return などは使用しないでください。
    if subject in progress:
        progress[subject] = True


## 3-2. complete_subject関数を実行し、「Python」と「CSS」を達成済みに変更してください。
complete_subject("Python")
complete_subject("CSS")


## 3-3. 再度print_unfinished関数を実行するコードを以下に記述してください。
print_unfinished()
