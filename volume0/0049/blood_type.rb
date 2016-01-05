#!/usr/bin/ruby
=begin
AOJ問題 volume0-0049 血液型
ある学級の生徒の出席番号と ABO 血液型を保存したデータを読み込んで、
おのおのの血液型の人数を出力して終了するプログラムを作成してください。
なお、ABO 血液型では、A 型、B 型、AB 型、O 型の4 分類になっています。
[input]
出席番号, 血液型（1 人目のデータ：整数, 文字列）
出席番号, 血液型（2 人目のデータ：整数, 文字列）
出席番号, 血液型（3 人目のデータ：整数, 文字列）
...
...
[output]
A 型の人数（整数）
B 型の人数（整数）
AB 型の人数（整数）
O 型の人数（整数）
=end

type_num = {A: 0, B: 0, O: 0, AB: 0}
 
while line = gets
  type_num[line.chomp.split(",")[1].to_sym] += 1
end
 
puts type_num[:A]
puts type_num[:B]
puts type_num[:AB]
puts type_num[:O]
