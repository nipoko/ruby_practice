#!/usr/bin/ruby
=begin
AOJ問題 volume0-0018 5つの整数のソート
5つの整数a,b,c,d,eを入力し、降順に整列した後に出力して終了するプログラムを作成してください。
[input]
a b c d e
が、それぞれ1つの空白で区切られて1行に与えられます。
[output]
降順に整列した5つの整数を1行に出力してください。各整数の間は1つの空白を入れてください。
[sample input]
3 6 9 7 5
[sample output]
9 7 6 5 3
=end

File.readlines("./input.txt").map(&:chomp).each do |line|
  puts line.split(" ").map(&:to_i).sort{|a, b| b <=> a}.join(" ")
end
