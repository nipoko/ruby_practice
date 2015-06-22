#!/usr/bin/ruby
=begin
AOJ問題 volume0-0020 大文字変換
文字列に含まれる半角英小文字を半角英大文字に置き換えて、その文字列を出力して終了するプログラムを作成してください。
半角英小文字以外の文字は置き換えないでください。
[input]
半角英小文字、ピリオド、空白のみを含む文字列
[output]
半角英小文字を半角英大文字に置き換えた文字列
[sample input]
this is a pen.
[sample output]
THIS IS A PEN.
=end

puts File.read("./input.txt").chomp.upcase
