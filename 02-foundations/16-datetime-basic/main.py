from datetime import datetime, timedelta

# Q1: `datetime`オブジェクトのフォーマット指定
# 2023年4月1日 15時30分00秒 を表すdatetimeオブジェクトを作成
dt_obj = datetime(2023, 4, 1, 15, 30, 0)

# strftime() を使って指定されたフォーマットの文字列に変換
formatted_str = dt_obj.strftime("%Y-%m-%d %H:%M:%S")
print(formatted_str)


# Q2: `timedelta` を使った日付の計算
# 7日後の日時を計算
future_dt = dt_obj + timedelta(days=7)

# 7日後の日時を指定されたフォーマットの文字列に変換
future_formatted_str = future_dt.strftime("%Y-%m-%d %H:%M:%S")
print(future_formatted_str)
