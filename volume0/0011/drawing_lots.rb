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

class Array
  def switch(datas)
    datas.each do |data|
      tmp               = self[data[1] - 1]
      self[data[1] - 1] = self[data[0] - 1]
      self[data[0] - 1] = tmp
    end
    return self
  end
end

data = File.readlines("./input.txt").map(&:chomp)
width = data[0].to_i
switch_num = data[1].to_i
switch_ary = data.slice(2, switch_num).map { |hoge|
  hoge.split(",").map(&:to_i)
}

puts (1..width).to_a.switch(switch_ary)
