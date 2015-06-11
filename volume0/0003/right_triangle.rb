#!/usr/bin/ruby
=begin
AOJ問題 volume0-0003 直角三角形の判定
1 以上 1000 以下の３つの正の整数を入力し、
それぞれの長さを３辺とする三角形が直角三角形である場合には YES を、
違う場合には NO と出力して終了するプログラムを作成して下さい。
[input]
複数のデータセットが与えられます。
１行目にデータセット数 N が与えられます。
続いて N 行の入力が与えれます。
各行に３つの整数が１つのスペースで区切られて与えられます。
[constraints]
* 1<=1辺の長さ<=1000
* N <= 1000
[output]
各データセットごとに、YES または NO を１行に出力して下さい。
[sample input]
3
4 3 5
4 3 6
8 8 8
[sample output]
YES
NO
NO
=end

class Array
  def right_triangle?
    length = self.slice(0, 3).map(&:to_i).sort
    (length[0] ** 2) + (length[1] ** 2) == length[2] ** 2
  end
end

input = File.readlines("./input.txt").map(&:chomp)
input.delete_at(0)

input.each do |data|
  puts data.split(" ").map(&:to_i).right_triangle? ? "YES" : "NO"
end
