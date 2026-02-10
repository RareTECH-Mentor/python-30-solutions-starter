#!/bin/bash

# check.sh
# このスクリプトは、仮想環境をアクティベートし、pytest を実行してテストが成功するかどうかを確認します。

# 仮想環境のパス
VENV_PATH="$(dirname "$0")/venv"

# 仮想環境のアクティベート
if [ -f "$VENV_PATH/bin/activate" ]; then
  source "$VENV_PATH/bin/activate"
else
  echo "仮想環境が見つかりません。'python3 -m venv venv' を実行して作成してください。"
  exit 1
fi

# pytestコマンドの存在確認
if ! command -v pytest &> /dev/null
then
    echo "pytest が見つかりません。'pip install pytest' を実行してインストールしてください。"
    exit 1
fi

# pytest を実行
pytest

# 仮想環境を非アクティブ化（任意）
deactivate
