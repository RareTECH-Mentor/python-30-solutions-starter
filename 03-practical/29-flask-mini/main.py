# main.py
# Flaskをインストールしてから実行してください (pip install Flask)

from flask import Flask

app = Flask(__name__)

# Q1: ルートURL ("/") にアクセスがあった場合に "Hello, Flask!" を返すエンドポイントを作成してください。
# ここにコードを書いてください


# Q2: "/about" URLにアクセスがあった場合に "This is the about page." を返すエンドポイントを作成してください。
# ここにコードを書いてください


# このファイルが直接実行されたときにのみサーバーを起動する
if __name__ == '__main__':
    app.run(debug=True)
