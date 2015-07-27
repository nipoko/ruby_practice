#!/usr/bin/ruby
=begin
AOJ問題 volume0-0010 三角形の外接円
平面上の点 (x1, y1) (x2, y2) (x3, y3) を頂点とした三角形の外接円の中心座標 (px, py) と半径 r を出力して終了するプログラムを作成してください。
[input]
複数のデータセットが与えられます。最初にデータセット数nが1行に与えられます。各データセットは以下の形式です。
x1 y1 x2 y2 x3 y3
ここで、各値は実数とします。
[output]
各データセットに対して、px, py, rを1つのスペースで区切って1行に出力してください。小数点以下第3位まで出力してください。小数点第4位を四捨五入してください。
[constraints]
* -100 <= x1, y1, x2, y2, x3, y3 <= 100
* n <= 20
[sample input]
1
0.0 0.0 2.0 0.0 2.0 2.0
[sample output]
1.000 1.000 1.414
=end

class TwoPoints
  def initialize(array)
      @x1, @y1, @x2, @y2 = array
  end
 
  attr_accessor :x1, :y1, :x2, :y2
 
  def bisector
    return [
      @x2 - @x1,
      @y2 - @y1,
      (@x2 ** 2 + @y2 ** 2 - @x1 ** 2 - @y1 ** 2) / 2.0
    ]
  end
 
  def distance
    return Math.sqrt(((@x2 - @x1) ** 2 + (@y2 - @y1) ** 2).abs)
  end
end
 
class Simultaneous
  def initialize(array)
    @a,@b,@c,@d,@e,@f = array
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
 
gets.to_i.times do
  data = gets.split(" ").map(&:to_f)
  center = Simultaneous.new(TwoPoints.new(data.slice(0, 4)).bisector + TwoPoints.new(data.slice(2, 4)).bisector).calc
  radius = TwoPoints.new(data.slice(0, 2) + center).distance
  puts sprintf("%.3f %.3f %.3f", center[0], center[1], radius)
end
