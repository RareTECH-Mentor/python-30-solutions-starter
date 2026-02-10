import re

# Q1: 文字列からEメールアドレスを抽出する
# `text` 文字列に含まれる全ての有効なEメールアドレスを正規表現を使って抽出し、
# それぞれのEメールアドレスを表示してください。
text = """
Contact list:
John Doe's email is john.doe@example.com.
Jane Smith can be reached at jane.smith@example.org.
For inquiries, please contact info@company.co.uk.
Invalid email: user@.com or @domain.com
"""
# ここにコードを書いてください