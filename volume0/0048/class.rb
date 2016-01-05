#!/usr/bin/ruby
=begin
AOJ問題 volume0-0048 階級
ボクシングは体重によって階級が分けられています。
体重を読み込んで、それぞれについて階級が何であるかを出力して終了するプログラムを作成してください。
階級と体重の関係は以下の表のとおりとします。
|階級         |体重（kg）             |
|:-----------|:--------------------|
|light fly   |48.00kg 以下          |
|fly         |48.00kg 超51.00kg 以下|
|bantam      |51.00kg 超54.00kg 以下|
|feather     |54.00kg 超57.00kg 以下|
|light       |57.00kg 超60.00kg 以下|
|light welter|60.00kg 超64.00kg 以下|
|welter      |64.00kg 超69.00kg 以下|
|light middle|69.00kg 超75.00kg 以下|
|middle      |75.00kg 超81.00kg 以下|
|light heavy |81.00kg 超91.00kg 以下|
|heavy       |91.00kg 超           |

[input]
体重（1 件目のデータ：実数)
体重（2 件目のデータ：実数)
...
...
[output]
階級（1 件目のデータに対する出力：文字列）
階級（2 件目のデータに対する出力：文字列）
...
...
=end

while line = gets
  weight = line.to_f
  case true
  when weight <= 48 then puts "light fly"
  when weight <= 51 then puts "fly"
  when weight <= 54 then puts "bantam"
  when weight <= 57 then puts "feather"
  when weight <= 60 then puts "light"
  when weight <= 64 then puts "light welter"
  when weight <= 69 then puts "welter"
  when weight <= 75 then puts "light middle"
  when weight <= 81 then puts "middle"
  when weight <= 91 then puts "light heavy"
  else puts "heavy"
  end
end
