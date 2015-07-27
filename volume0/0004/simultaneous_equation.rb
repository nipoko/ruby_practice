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

class Simultaneous
  def initialize(input)
    @a,@b,@c,@d,@e,@f = input.split(" ").map(&:to_f)
  end
 
  attr_accessor :a,:b,:c,:d,:e,:f
 
  def calc
    x = (@c * @e - @b * @f) / (@a * @e - @b * @d).to_f
    y = (@c * @d - @a * @f) / (@b * @d - @a * @e).to_f
    x = 0 if x.abs == 0.0
    y = 0 if y.abs == 0.0
    return [x, y]
  end
end
 
while data = gets
  ans = Simultaneous.new(data).calc
  puts sprintf("%.3f %.3f", ans[0], ans[1])
end
