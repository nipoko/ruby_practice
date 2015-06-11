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

class Array
  def bisector
    return [
      self[2] - self[0],
      self[3] - self[1],
      (self[2] ** 2 + self[3] ** 2 - self[0] ** 2 - self[1] ** 2) / 2.0,
      self[4] - self[0],
      self[5] - self[1],
      (self[4] ** 2 + self[5] ** 2 - self[0] ** 2 - self[1] ** 2) / 2.0,
    ]
  end

  def distance
    return Math.sqrt(self[2] ** 2 + self[3] ** 2 - self[0] ** 2 - self[1] ** 2)
  end

  def simultaneous
    x = (self[2] * self[4] - self[1] * self[5]) / (self[0] * self[4] - self[1] * self[3]).to_f
    y = (self[2] * self[3] - self[0] * self[5]) / (self[1] * self[3] - self[0] * self[4]).to_f
    return [x, y]
  end

  def print_float
    print sprintf("%.3f %.3f %.3f", self[0], self[1], self[2])
  end
end

input = File.readlines("./input.txt").map(&:chomp)
input.delete_at(0)

input.each do |data|
  data_ary = data.split(" ").map(&:to_f)
  center = data_ary.bisector.simultaneous
  r = [data_ary[0], data_ary[1], center[0], center[1]].distance
  puts [center[0], center[1], r].print_float
end
