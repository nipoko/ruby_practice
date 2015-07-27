#!/usr/bin/ruby
=begin
AOJ問題 volume0-0011 あみだくじ
最初の状態 1, 2, 3, 4, ...が、与えられた横棒のリストを通過したのち、どのような順番になるかを出力して終了するプログラムを作成してください。
[input]
w      # 縦線の本数（w <= 30）
n      # 横棒の本数（n <= 30）
a1, b1 # 1番目の横棒
a2, b2
a3, b3
...
an, bn # n番目の横棒
[output]
左から右に、
1番目の棒にくる数字 2番目の棒に来る数字 ... w番目の棒に来る数字
[sample input]
5
4
2,4
3,5
1,2
3,4
[sample output]
4 1 2 5 3
=end

class DrawingLots
  def initialize(width, switch_ary)
    @results = (1..width).to_a
    switch_ary.each do |data|
      tmp                   = @results[data[1] - 1]
      @results[data[1] - 1] = @results[data[0] - 1]
      @results[data[0] - 1] = tmp
    end
  end
 
  attr_accessor :results
 
  def all_result
    return @results
  end
end
 
width = gets.to_i
switch_ary = []
gets.to_i.times do
  switch_ary << gets.split(",").map(&:to_i)
end
 
puts DrawingLots.new(width, switch_ary).all_result.join("\n")
