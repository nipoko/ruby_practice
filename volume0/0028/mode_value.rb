#!/usr/bin/ruby
=begin
AOJ問題 volume0-0028 最頻値
100件までの整数データをファイルから読みこんで、データの最頻値を出力して終了するプログラムを作成してください。
最頻値とは、最も頻度の高い（出現回数が多い）値のことです。
[input]
整数データ（100件以内）
[output]
整数データの最頻値。複数ある場合は値の小さい順に改行して全て表示してください。
[sample input]
5
6
3
5
8
7
5
3
9
7
3
4
[sample output]
3
5
=end

count = Hash.new(0)

File.readlines("./input.txt").each do |line|
    count[line.chomp] += 1
end

prev_value = 0
count.sort{|a, b| a[0] <=> b[0]}.sort {|a, b| b[1] <=> a[1]}.each do |key, value|
  prev_value = value if prev_value == 0
  break unless prev_value == value
  puts key
end
