#!/usr/bin/ruby
=begin
AOJ問題 volume0-0059 長方形の重なり
底辺がx軸に対して平行な2つの長方形があります。
長方形 A の左下の座標(xa1, ya1) と右上の座標(xa2, ya2)、
長方形 B の左下の座標(xb1, yb1) と右上の座標(xb2, yb2)を読み込んで、
それぞれについて、長方形 A と長方形 B が一部でも重なっていれば YES を、
まったく重なっていなければ NO を出力して終了するプログラムを作成してください。
ただし、長方形 A と長方形 B は同じものではないとします。
また、接しているものも重なっているとみなします。
[sample input]
xa1 ya1 xa2 ya2 xb1 yb1 xb2 yb2
xa1 ya1 xa2 ya2 xb1 yb1 xb2 yb2
xa1 ya1 xa2 ya2 xb1 yb1 xb2 yb2
...
[sample output]
YES / NO
YES / NO
YES / NO
...
=end

class Square
  def initialize(x1, y1, x2, y2)
    @point_lb = [x1, y1]
    @point_rt = [x2, y2]
    @point_rb = [x2, y1]
    @point_lt = [x1, y2]
  end

  attr_accessor :point_lb, :point_rb, :point_lt, :point_rt

  def points
    [@point_lb, @point_rb, @point_lt, @point_rt]
  end

  def intersection?(point)
    @point_lb[0] <= point[0] && point[0] <= @point_rt[0] &&
    @point_lb[1] <= point[1] && point[1] <= @point_rt[1]
  end
end

while data = gets
  datas = data.split(" ").map(&:to_f)
  square1 = Square.new(datas[0], datas[1], datas[2], datas[3])
  square2 = Square.new(datas[4], datas[5], datas[6], datas[7])
  ans = false
  square2.points.each do |point|
    ans = square1.intersection?(point)
    break if ans
  end
  unless ans then
    square1.points.each do |point|
      ans = square2.intersection?(point)
      break if ans
    end
  end
  puts ans ? "YES" : "NO"
end
