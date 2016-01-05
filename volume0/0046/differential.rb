#!/usr/bin/ruby
=begin
AOJ問題 volume0-0046 標高差
今まで登ったことのある山の標高を記録したデータがあります。
このデータを読み込んで、一番高い山と一番低い山の標高差を出力して終了するプログラムを作成してください。
[input]
山の高さ（実数）
...
...
[output]
一番高い山と一番低い山の標高差（実数）。出力は0.01以下の誤差を含んでもよい。
=end

higher = 0
lower = 0
 
while line = gets
  tmp = line.to_f
  lower = tmp if lower == 0 || lower > tmp
  higher = tmp if higher < tmp
end
 
puts (higher - lower).round(1)
