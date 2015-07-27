#!/usr/bin/ruby
=begin
AOJ問題 volume0-0001 山の高さ
山の高さをメートル単位の整数で表した 10 個のデータがあります。
その 10 個のデータを読み込んで、その中で、
高い順から３つ出力して終了するプログラムを作成して下さい。
[sample input]
1819
2003
876
2840
1723
1673
3776
2848
1592
922
[sample output]
3776
2848
2840
=end

nums = []
 
10.times do
  nums << gets.to_i
end
 
puts nums.sort.reverse.slice(0, 3).join("\n")
