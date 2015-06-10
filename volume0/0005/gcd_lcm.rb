#!/usr/bin/ruby
=begin
AOJ問題 volume0-0005 最大公約数と最小公倍数
２０億以下の正の整数 a, b を入力したとき、a と b の最大公約数と最小公倍数を出力して終了するプログラムを作成して下さい。ただし、a と b の最小公倍数は 20 億を超えないものとします。
[input]
複数のデータセットが与えられます。各データセットは１行に a と b が１つのスペースで区切られて与えられます。入力の最後まで処理して下さい。
[output]
各データセットに対して、最大公約数と最小公倍数を１つのスペースで区切って１行に出力して下さい。
[sample input]
8 6
50000000 30000000
[sample output]
2 24
10000000 150000000
=end
require "rational"

class Array
  def print_gcd_lcm
    print "#{self[0].gcd(self[1])} #{self[0].lcm(self[1])}"
  end
end

input = File.readlines("./input.txt").map(&:chomp)

input.each do |data|
  puts data.split(" ").map(&:to_i).print_gcd_lcm
end
