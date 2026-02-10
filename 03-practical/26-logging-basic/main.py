import logging

# Q1: 基本的なロギング設定とメッセージ出力

logging.basicConfig(
    level=logging.INFO,
    format='%(levelname)s:%(message)s'
)

logging.info("Processing data...")
logging.warning("Something unexpected happened.")