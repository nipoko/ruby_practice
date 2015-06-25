#!/usr/bin/ruby
=begin
AOJ問題 volume0-0023 円の交差
中心が (xa, ya) で半径 ra の円 A と、中心が (xb, yb) で半径 rb の円 B が与えられたとき、
B が A の中にあるとき 2、A が B の中にあるとき -2、A の円周と B の円周が交わっている場合 1、
A と B が重なっていないとき 0 を出力して終了するプログラムを作成して下さい。
なお A と B は同じものではないとします。
[input]
複数のデータセットが与えられます。１行目にデータセット数 N が与えられます。
つづいて N 行の入力が与えられます。各データセットの形式は以下のとおりです。
xa ya ra xb yb rb
ここで、入力の値はすべて実数です。
[output]
各データセットに対して、2, -2, 1, 0 のいずれかの数値を１行に出力して下さい。
[sample input]
2
0.0 0.0 5.0 0.0 0.0 4.0
0.0 0.0 2.0 4.1 0.0 2.0
[sample output]
2
0
=end

# 円の中心間のベクトル : v→ = (x2-x1,y2-y1)
# vの長さ：d = |v| = sqrt((x2-x1)^2+(y2-y1)^2)
#
# 円の位置関係
#
# d＞r1+r2のとき、交点はない。（離れている）
# d＝r1+r2のとき、交点は1つ。（外接）
# |r1-r2|＜d＜r1+r2のとき、交点は2つ。（交わる）
# |r1-r2|＝dのとき、交点は1つ。（内接）
# |r1-r2|＞dのとき、交点はない。（内包）
# r1=r2かつd=0のとき、交点は無数にある。（一致）

class Array
  def length
    Math.sqrt((self[3] - self[0]) ** 2 + (self[4] - self[1]) ** 2)
  end

  def circle_intersection
    length = self.length
    if length > self[2] + self[5] then
      return 0
    elsif (self[2] - self[5]).abs <= length && length <= self[2] + self[5] then
      return 1
    elsif self[2] > self[5] then
      return 2
    elsif self[2] < self[5] then
      return -2
    else
      return -9999
    end
  end
end

file = File.readlines("./input.txt").map(&:chomp)
file.shift

file.each do |data|
  puts data.split(" ").map(&:to_f).circle_intersection
end
