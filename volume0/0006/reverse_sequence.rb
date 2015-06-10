#!/usr/bin/ruby
=begin
AOJ問題 volume0-0006 文字列を逆順に出力
文字列 str を入力したとき、その文字列を逆順に出力するプログラムを作成して下さい。文字は半角英数字のみで、20 文字以内とします。
[input]
文字列 str
[output]
str の逆順
[sample input]
w32nimda
[sample output]
admin23w
=end

puts File.read("./input.txt").chomp.reverse
