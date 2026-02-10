import re

# Q1: 文字列からEメールアドレスを抽出する

text = """
Contact list:
John Doe's email is john.doe@example.com.
Jane Smith can be reached at jane.smith@example.org.
For inquiries, please contact info@company.co.uk.
Invalid email: user@.com or @domain.com
"""

# Eメールアドレスを抽出するための正規表現パターン
# \w は [a-zA-Z0-9_] と等価
# \. はドット(.)そのもの
# + は直前の文字が1回以上繰り返すことを示す
email_pattern = r"[\w\.-]+@[\w\.-]+\.\w+"

emails = re.findall(email_pattern, text)

for email in emails:
    print(email)
