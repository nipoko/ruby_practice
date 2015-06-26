#!/usr/bin/ruby
=begin
AOJ問題 volume0-0027 今日は何曜日？
2004年1月1日から12月31日までの日付を入力し、その日の曜日を出力して終了するプログラムを作成してください。
なお、2004年1月1日は木曜日です。また、2004年はうるう年ですので2月29日があることに注意してください。
[input]
複数のデータセットを処理しなければなりません。
1つのデータセットに月と日が1つのスペースで区切られて1行に与えられます。
月が0となったとき入力の最後とします（この場合は処理をしないでプログラムを終了させる）。
[output]
各データセットごとに曜日を英語で1行に出力してください。
[sample input]
1 1
2 29
0 0
[sample output]
Thursday
Sunday
=end
require 'date'

File.readlines("./input.txt").each do |line|
  date_ary = line.split(" ").map(&:to_i)
  break if date_ary[0] == 0
  puts Date.new(2004, date_ary[0], date_ary[1]).strftime("%A")
end
