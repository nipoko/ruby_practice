#!/usr/bin/ruby
=begin
AOJ問題 volume0-0021 平行の判定
A = (x1, y1), B = (x2, y2), C = (x3, y3), D = (x4, y4) の異なる４つの座標点が与えられたとき、
直線 AB と CD が平行かどうかを判定し、平行である場合には YES、平行でない場合には NO と出力して
終了するプログラムを作成して下さい。
なお、x1, y1, x2, y2, x3, y3, x4, y4 は、それぞれ -100 以上 100 以下とします。
[input]
複数のデータセットが与えられます。一行目にデータセットの数 n が与えられます。
つづいて n 行のデータセットが与えられます。各データセットの形式は以下のとおりです。
x1 y1 x2 y2 x3 y3 x4 y4
* 各値は小数点以下最大5桁までの数字を含む実数である。
* データセットの数nは100を超えない。
[output]
各データセットに対して、YESまたはNOを1行に出力してください。
[sample input]
2
0.0 0.0 1.0 1.0 1.0 0.0 2.0 1.0
3.0 2.0 9.0 6.0 13.0 5.0 7.0 9.0
[sample output]
YES
NO
=end

class Array
  def parallel?
    [self[0], self[1], self[2], self[3]].slope == [self[4], self[5], self[6], self[7]].slope
  end

  def slope
    (self[3] - self[1]) / (self[2] - self[0])
  end
end

file = File.readlines("./input.txt").map(&:chomp)
file.shift

file.each do |line|
  puts line.split(" ").map(&:to_f).parallel? ? "YES" : "NO"
end
