# test_main.py
from main import add, subtract

def test_add():
  """
  add() 関数のテスト
  """
  assert add(1, 2) == 3
  assert add(-1, 1) == 0
  assert add(-1, -1) == -2

def test_subtract():
  """
  subtract() 関数のテスト
  """
  assert subtract(2, 1) == 1
  assert subtract(1, 2) == -1
  assert subtract(1, 1) == 0
