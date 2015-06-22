#!/usr/bin/ruby

# String#ord(String)  文字に対応するコードポイントを数値で返す
# Integer#chr(String) 数値をコードポイントとして読み、その文字を返す
# いずれも引数はエンコーディング

# アルファベットを文字コードで数値化して、隣の文字との差を出すテスト
# this : 12 -1 -10
puts "t".ord - "h".ord
puts "h".ord - "i".ord
puts "i".ord - "s".ord
puts
# that 12 7 -19
puts "t".ord - "h".ord
puts "h".ord - "a".ord
puts "a".ord - "t".ord
puts
# it -11
puts "i".ord - "t".ord
puts

# 片方が一巡してる場合は-26（一巡戻す）する
# 両方が一巡してる場合はそのままでOK
# 「一巡してる」をどう判断するか？
# this
puts "b".ord - "p".ord + 26
puts "p".ord - "q".ord
puts "q".ord - "a".ord - 26
puts
