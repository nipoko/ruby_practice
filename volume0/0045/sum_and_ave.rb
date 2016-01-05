#!/usr/bin/ruby
=begin
AOJ問題 volume0-0045 合計と平均
販売単価と販売数量を読み込んで、販売金額の総合計と販売数量の平均を出力して終了するプログラムを作成してください。
[input]
販売単価, 販売数量（全て整数）
販売単価, 販売数量（全て整数）
販売単価, 販売数量（全て整数）
...
...
[output]
販売金額の総合計（整数）
販売数量の平均(整数）
=end

price_sum = 0
num_sum = 0
line_num = 0
 
while line = gets
  price, num = line.split(",").map(&:to_i)
  price_sum += price * num
  num_sum += num
  line_num += 1
end
 
puts price_sum
puts (num_sum.to_f / line_num.to_f).round
