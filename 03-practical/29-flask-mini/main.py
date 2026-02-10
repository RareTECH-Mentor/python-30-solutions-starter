# main.py
# Flaskをインストールしてから実行してください (pip install Flask)

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, Flask!'

@app.route('/about')
def about_page():
    return 'This is the about page.'

# このファイルが直接実行されたときにのみサーバーを起動するおまじない
# (flask run コマンドを使う場合は不要ですが、python main.py で実行する際に便利です)
if __name__ == '__main__':
    app.run(debug=True)