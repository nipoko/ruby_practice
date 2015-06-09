#!/usr/bin/ruby
=begin
AOJ問題 volume0-0002 整数の和の桁数
与えられた２つの整数 a と b の和の桁数を出力して終了するプログラムを作成して下さい。
[sample input]
5 7
1 99
1000 999
[sample output]
2
3
4
=end

puts File.readlines("./digit_number.txt").map{|data| data.split(" ").map(&:to_i).inject(:+).to_s.size}
