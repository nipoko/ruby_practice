#!/usr/bin/ruby
=begin
連立方程式
ax + by = c
dx + ey = f
の解、x, y を出力して終了するプログラムを作成して下さい。a, b, c, d, e, f はそれぞれ、 -1000 以上 1000 以下の実数とし、連立方程式の解が一意に存在するように与えられるものとします。
[input]
複数のデータセットが与えられます。入力の最後まで処理して下さい。１つのデータセットが１行に与えられます。１つのデータセットに a, b, c, d, e, f が１つのスペースで区切られて与えられます。
[output]
各データセットに対して、x, y を１つのスペースで区切って１行に出力して下さい。各値は小数点以下第３位まで出力して下さい。小数点以下第４位を四捨五入して下さい。
[sample input]
1 2 3 4 5 6
2 -1 -2 -1 -1 -5
[sample output]
-1.000 2.000
1.000 4.000
=end

class Array
  def simultaneous
    x = (self[2] * self[4] - self[1] * self[5]) / (self[0] * self[4] - self[1] * self[3]).to_f
    y = (self[2] * self[3] - self[0] * self[5]) / (self[1] * self[3] - self[0] * self[4]).to_f
    return [x, y]
  end

  def print_float
    print sprintf("%.3f %.3f", self[0], self[1])
  end
end


file = File.readlines("./input.txt").map(&:chomp)

file.each do |data|
  puts data.split(" ").map(&:to_i).simultaneous.print_float
end
