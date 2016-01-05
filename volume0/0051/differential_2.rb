#!/usr/bin/ruby
=begin
AOJ問題 volume0-0051 最大の整数と最小の整数の差
8 個の 0 から 9 までの数字を入力したとき、その 8 個の数字を並べ替えてできる、
最大の整数と最小の整数の差を出力して終了するプログラムを作成してください。
並び替えてできる数は 00135569 のように 0 から始まってもよいものとします。
[input]
複数のデータセットが与えられます。１行目にデータセット数 n が与えられます。
続いて n 行のデータが与えられます。各データは 8 個の数字の並び（0 から9 の数字）です。
[output]
各データセットに対して、入力された数字を並べ替えてできる最大の整数と最小の整数の差を１行に出力して下さい。
=end

num = gets.to_i
 
num.times do
  str = gets.chomp
  minnum = str.chars.sort.join.to_i
  maxnum = str.chars.sort.reverse.join.to_i
  puts maxnum - minnum
end
