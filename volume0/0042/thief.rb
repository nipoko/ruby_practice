#!/usr/bin/ruby
=begin
AOJ問題 volume0-0042 泥棒
宝物がたくさん収蔵されている博物館に、泥棒が大きな風呂敷を一つだけ持って忍び込みました。
盗み出したいものはたくさんありますが、風呂敷が耐えられる重さが限られており、これを超えると風呂敷が破れてしまいます。
そこで泥棒は、用意した風呂敷を破らず且つ最も価値が高くなるようなお宝の組み合わせを考えなくてはなりません。
風呂敷が耐えられる重さ W、および博物館にある個々のお宝の価値と重さを読み込んで、
重さの総和が W を超えない範囲で価値の総和が最大になるときの、お宝の価値総和と重さの総和を出力して終了するプログラムを作成してください。
ただし、価値の総和が最大になる組み合わせが複数あるときは、重さの総和が小さいものを出力することとします。
また、博物館にあるお宝の総数は 1000 以下とし、お宝の価値は10000 以下とします。
[input]
数のデータセットが与えられます。各データセットは以下のような形式です。

風呂敷の耐えられる重さW(1000 以下)
お宝の数 N
お宝 1 の価値(整数), お宝 1 の重さ( ＜ W:整数)
お宝 2 の価値(整数), お宝 2 の重さ( ＜ W:整数)
.
.
.
お宝 N の価値(整数), お宝 N の重さ( ＜ W:整数)
W が 0 のとき入力の最後とします。
[output]
各データセットに対して以下のように出力して下さい。

Case データセットの番号:
風呂敷に入れたお宝の価値総和
そのときのお宝の重さの総和
[sample input]
50
5
60,10
100,20
120,30
210,45
10,4
50
5
60,10
100,20
120,30
210,45
10,4
0
[sample output]
Case 1:
220
49
Case 2:
220
49
=end

case_num = 0

file = File.readlines("./input.txt")

until file[0] == "0\n"
  case_num += 1
  total_value = 0
  weight = file.shift.to_i
  total_weight = weight
  treasure_num = file.shift.to_i

  treasures = []
  treasure_num.times do
    treasures << file.shift.split(",").map(&:to_i)
  end

  treasure_num.times do |n|
    treasures.combination(n + 1).each do |comb|
      tmp_value = 0
      tmp_weight = 0
      comb.each do |treasure|
        tmp_value += treasure[0]
        tmp_weight += treasure[1]
      end
      if (tmp_value > total_value && tmp_weight <= weight) || (tmp_value == total_value && tmp_weight < total_weight) then
        total_value = tmp_value
        total_weight = tmp_weight
      end
    end
  end

  puts "Case #{case_num}:"
  puts total_value
  puts total_weight
end
