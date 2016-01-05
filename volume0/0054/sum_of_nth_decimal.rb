#!/usr/bin/ruby
=begin
AOJ問題 volume0-0054 小数の和
a, b, n は、いずれも正の整数であるとします。
分数 a / b の小数第 i 位の数を f(i) とします(0 ≦ f(i) ≦ 9)。
このとき、i = 1 から n までの f(i) の和を s とします。
s = f(1) + f(2) + ... + f(n)
a, b, n を読み込んで、それぞれについて s を出力して終了するプログラムを作成してください。
[input]
a b n（1 件目のデータ：全て整数）
a b n（2 件目のデータ：全て整数）
a b n（3 件目のデータ：全て整数）
...
...
[output]
s（1 件目のデータに対する出力：整数）
s（2 件目のデータに対する出力：整数）
s（3 件目のデータに対する出力：整数）
...
...
=end

while line = gets
  a, b, n = line.split(" ").map(&:to_i)
  puts ((a % b).to_f * (10 ** n) / b).to_i.to_s.chars.map(&:to_i).inject(:+)
end
