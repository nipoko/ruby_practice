#!/usr/bin/ruby
=begin
AOJ問題 volume0-0009 素数
6桁以下の正の整数nを入力し、n以下の素数がいくつあるかを出力するプログラムを作成してください。ただし、素数とは1と自分自身でしか割り切れない正の整数のうち1を除いたものを言います。たとえば10以下の素数は2, 3, 5, 7です。
[input]
複数のデータセットが与えられます。各データセットにn（n<=999999）が1行に与えられます。入力の最後まで処理してください。
データセットの数は30を超えません。
[output]
各データセットごとに、n以下の素数の個数を1行に出力してください。
[sample input]
10
3
11
[sample output]
4
2
5
=end

require "prime"
 
while line = gets
  prime_num = 0
  Prime.each(line.to_i){
    prime_num += 1
  }
  puts prime_num
end
